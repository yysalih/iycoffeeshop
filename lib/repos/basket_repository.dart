import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/cart_item_model.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class BasketRepository {
  final String _uid;

  BasketRepository({String? uid})
      : _uid = uid ?? "";


  Stream<CartItemModel> getBasketProduct() {

    return firebaseFirestore.collection("users").doc(currentUserUid).collection("basket")
        .doc(_uid).snapshots().map((event) {
      return CartItemModel().fromJson(event.data()!);
    });
  }

  Stream<List<CartItemModel>> getBasketProducts() {
    return firebaseFirestore.collection("users").doc(currentUserUid).collection("basket").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => CartItemModel().fromJson(e.data())).toList();
    });
  }

}

final basketProductStreamProvider = StreamProvider.autoDispose.family<CartItemModel, String?>((ref, uid) {
  final basketProductRepository = ref.watch(basketProductRepositoryProvider(uid));
  return basketProductRepository.getBasketProduct();
});

final basketProductsStreamProvider = StreamProvider.autoDispose.family<List<CartItemModel>, String?>((ref, uid) {
  final basketProductRepository = ref.watch(basketProductRepositoryProvider(uid));
  return basketProductRepository.getBasketProducts();
});

final basketProductRepositoryProvider = Provider.family<BasketRepository, String?>((ref, uid) {
  return BasketRepository(uid: uid);
});