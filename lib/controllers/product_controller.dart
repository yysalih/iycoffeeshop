import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';

class ProductState {

}

class ProductController extends StateNotifier<ProductState> {
  ProductController(super.state);

  addFavoriteProduct({required String productUid, required List userFavorites}) async {
    if(!userFavorites.contains(productUid)) {
      final newList = userFavorites..add(productUid);
      await firebaseFirestore.collection("users").doc(currentUserUid).update({
        "favorites" : newList,
      });
    }
    else {
      final newList = userFavorites..remove(productUid);
      await firebaseFirestore.collection("users").doc(currentUserUid).update({
        "favorites" : newList,
      });
    }
  }
}

final productController = StateNotifierProvider<ProductController, ProductState>(
  (ref) => ProductController(ProductState()),
);