import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/cart_item_model.dart';
import 'package:iycoffee/models/order_model.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/views/payment_views/payment_successful_view.dart';
import 'package:iycoffee/widgets/app_widgets/app_status_widget.dart';
import 'package:uuid/uuid.dart';

import '../constants/providers.dart';
import '../constants/snackbars.dart';

class OrderState {
  final List<CartItemModel> cart;

  OrderState({required this.cart});

  OrderState copyWith({List<CartItemModel>? cart}) {
    return OrderState(
      cart: cart ?? this.cart
    );
  }
}

class OrderController extends StateNotifier<OrderState> {
  OrderController(super.state);

  createOrder({required BuildContext context, required String errorTitle}) async {

    showDialog(context: context, builder: (context) => const CreatingOrderDialog());

    String uid = const Uuid().v4();

    OrderModel orderModel = OrderModel(
      uid: uid,
      products: state.cart.map((e) => e.toJson(),).toList(),
      status: "sent",
      customerUid: currentUserUid,
      createdAt: DateTime.now(),
      orderNumber: generateOrderNumber(),
      note: "",
      totalPrice: state.cart.where((element) => element.totalPrice != null).toList()
          .fold(0.0, (previousValue, element) => previousValue! + element.totalPrice!)
    );

    await firebaseFirestore.collection("orders").doc(orderModel.uid)
        .set(orderModel.toJson())
        .whenComplete(() async {
      debugPrint("order created");

      await firebaseFirestore.collection("users").doc(currentUserUid).update({
        "orders": FieldValue.arrayUnion([orderModel.uid]),
        "wallet": FieldValue.increment(-orderModel.totalPrice!)
      });

      clearBasket();

      context.pop();
      context.go("/paymentSuccessful");

    }).onError((error, stackTrace) {
      debugPrint("Error in create method: $error");
      debugPrint('Error: $stackTrace');
      context.pop();

      showSnackbar(title: errorTitle, context: context);
    });

  }

  addProduct(ProductModel value, int piece) {
    CartItemModel basketModel = CartItemModel(
        uid: const Uuid().v4(),
        totalPrice: value.price!,
        price: value.price!,
        piece: piece,
        productUid: value.uid!,
        type: value.type!
    );
    state = state.copyWith(cart: state.cart..add(basketModel),);
  }

  addProductInBasket(ProductModel product, int piece) {
    CartItemModel basketModel = CartItemModel(
      uid: const Uuid().v4(),
      totalPrice: product.price! * piece,
      price: product.price!,
      piece: piece,
      productUid: product.uid!,
      type: product.type!
    );

    state = state.copyWith(cart: state.cart..add(basketModel),);
  }

  changePiece(CartItemModel model, {required bool isIncrement}) {
    int newPiece = isIncrement ? (model.piece! + 1) : (model.piece! - 1);

    if (newPiece < 1) {
      state = state.copyWith(
        cart: state.cart.where((item) => item.uid != model.uid).toList(),
      );
    } else {
      state = state.copyWith(
        cart: state.cart.map((item) {
          if (item.uid == model.uid) {
            return item.copyWith(
              piece: newPiece,
              totalPrice: item.price! * newPiece,
            );
          }
          return item;
        }).toList(),
      );
    }

    debugPrint("Current Cart Pieces: ${state.cart.map((e) => e.toJson())}");
  }

  String generateOrderNumber() {
    final now = DateTime.now();
    // Format: 260513 (Date) + last 4 digits of timestamp
    return "${now.year.toString().substring(2)}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.millisecondsSinceEpoch.toString().substring(9)}*$currentUserUid";
  }

  clearBasket() => state = state.copyWith(cart: []);
}

final orderController = StateNotifierProvider<OrderController, OrderState>(
  (ref) => OrderController(OrderState(cart: []),),
);