import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/cart_item_model.dart';
import 'package:iycoffee/models/order_model.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/views/payment_views/payment_successful_view.dart';
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

  createOrder({required BuildContext context, required String errorTitle,
    required String successTitle}) async {

    String? token = await FirebaseMessaging.instance.getToken();

    String uid = const Uuid().v4();
    OrderModel orderModel = OrderModel(
      uid: uid,
      products: state.cart.map((e) => e.toJson(),).toList(),
      status: "sent",
      who: currentUserUid,
      totalPrice: state.cart.where((element) => element.totalPrice != null).toList()
          .fold(0.0, (previousValue, element) => previousValue! + element.totalPrice!)
    );

    await firebaseFirestore.collection("orders").doc(orderModel.uid)
        .set(orderModel.toJson())
        .whenComplete(() {
      debugPrint("order created");
      Navigator.push(context, routeToView(const PaymentSuccessfulView()));
      showSnackbar(title: successTitle, context: context);
    })
        .onError((error, stackTrace) {
      debugPrint("Error in create method: $error");
      debugPrint('Error: $stackTrace');

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
    if (isIncrement) {
      CartItemModel updatedModel = CartItemModel(
        piece: model.piece! + 1,
        uid: model.uid,
        productUid: model.productUid,
        price: model.price,
        totalPrice: model.totalPrice,
        type: model.type
      ).fromJson(model.toJson());

      state = state.copyWith(
        cart: state.cart.map((basketItem) {
          if (basketItem.uid == updatedModel.uid) {
            return updatedModel;
          } else {
            return basketItem;
          }
        }).toList(),
      );
    }
    else {
      CartItemModel updatedModel = CartItemModel(
        piece: model.piece! - 1,
        uid: model.uid,
        productUid: model.productUid,
        price: model.price,
        totalPrice: model.totalPrice,
        type: model.type
      ).fromJson(model.toJson());

      state = state.copyWith(
        cart: state.cart.map((basketItem) {
          if (basketItem.uid == updatedModel.uid) {
            return updatedModel;
          } else {
            return basketItem;
          }
        }).toList(),
      );
    }
    debugPrint("${state.cart.map((e) => e.piece!,)}");
  }

  clearBasket() => state = state.copyWith(cart: []);
}

final orderController = StateNotifierProvider<OrderController, OrderState>(
  (ref) => OrderController(OrderState(cart: []),),
);