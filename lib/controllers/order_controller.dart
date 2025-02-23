import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/basket_model.dart';
import 'package:iycoffee/models/order_model.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:iycoffee/views/payment_views/payment_successful_view.dart';
import 'package:uuid/uuid.dart';

import '../constants/providers.dart';
import '../constants/snackbars.dart';
import '../views/main_view.dart';

class OrderState {
  final List<BasketModel> basket;

  OrderState({required this.basket});

  OrderState copyWith({List<BasketModel>? baskets}) {
    return OrderState(
      basket: baskets ?? this.basket
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
      products: state.basket.map((e) => e.toJson(),).toList(),
      status: "sent",
      who: currentUserUid,
      totalPrice: state.basket.where((element) => element.totalPrice != null).toList()
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
    BasketModel basketModel = BasketModel(
        uid: const Uuid().v4(),
        totalPrice: value.price!,
        price: value.price!,
        piece: piece,
        productUid: value.uid!
    );
    state = state.copyWith(baskets: state.basket..add(basketModel),);
  }

  addProductInBasket(ProductModel product, int piece) {
    BasketModel basketModel = BasketModel(
      uid: const Uuid().v4(),
      totalPrice: product.price! * piece,
      price: product.price!,
      piece: piece,
      productUid: product.uid!
    );

    state = state.copyWith(baskets: state.basket..add(basketModel),);
  }

  changePiece(BasketModel model, {required bool isIncrement}) {
    if (isIncrement) {
      BasketModel updatedModel = BasketModel(
        piece: model.piece! + 1,
        uid: model.uid,
        productUid: model.productUid,
        price: model.price,
        totalPrice: model.totalPrice,
      ).fromJson(model.toJson());

      state = state.copyWith(
        baskets: state.basket.map((basketItem) {
          if (basketItem.uid == updatedModel.uid) {
            return updatedModel;
          } else {
            return basketItem;
          }
        }).toList(),
      );
    }
    else {
      BasketModel updatedModel = BasketModel(
        piece: model.piece! - 1,
        uid: model.uid,
        productUid: model.productUid,
        price: model.price,
        totalPrice: model.totalPrice,
      ).fromJson(model.toJson());

      state = state.copyWith(
        baskets: state.basket.map((basketItem) {
          if (basketItem.uid == updatedModel.uid) {
            return updatedModel;
          } else {
            return basketItem;
          }
        }).toList(),
      );
    }
    debugPrint("${state.basket.map((e) => e.piece!,)}");
  }

  clearBasket() => state = state.copyWith(baskets: []);
}

final orderController = StateNotifierProvider<OrderController, OrderState>(
  (ref) => OrderController(OrderState(basket: []),),
);