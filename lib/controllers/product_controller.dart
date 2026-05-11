import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductState {

}

class ProductController extends StateNotifier<ProductState> {
  ProductController(super.state);

  addFavoriteProduct({required String productUid, required List userFavorites}) async {
    if(!userFavorites.contains(productUid)) {
      final newList = userFavorites..add(productUid);
      await firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
        "favorites" : newList,
      });
    }
    else {
      final newList = userFavorites..remove(productUid);
      await firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
        "favorites" : newList,
      });
    }
  }

  createProduct({required String title, required String image, required String description, required double price, required String category}) async {
    ProductModel productModel = ProductModel(
      uid: const Uuid().v4(),
      name: title,
      image: image,
      description: description,
      price: price,
      type: category
    );

    await firebaseFirestore.collection("cakes").doc(productModel.uid).set(productModel.toJson()).then((value) {
      debugPrint("${productModel.name} is created");
    },);
  }
}

final drinksController = StateNotifierProvider<ProductController, ProductState>(
  (ref) => ProductController(ProductState()),
);