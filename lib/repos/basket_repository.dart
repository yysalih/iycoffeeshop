import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/basket_model.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class BasketRepository {
  final String _uid;

  BasketRepository({String? uid})
      : _uid = uid ?? "";


  Stream<BasketModel> getBasketProduct() {

    return firebaseFirestore.collection("users").doc(currentUserUid).collection("basket")
        .doc(_uid).snapshots().map((event) {
      return BasketModel().fromJson(event.data()!);
    });
  }

  Stream<List<BasketModel>> getBasketProducts() {
    return firebaseFirestore.collection("users").doc(currentUserUid).collection("basket").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => BasketModel().fromJson(e.data())).toList();
    });
  }

}

final basketProductStreamProvider = StreamProvider.autoDispose.family<BasketModel, String?>((ref, uid) {
  final basketProductRepository = ref.watch(basketProductRepositoryProvider(uid));
  return basketProductRepository.getBasketProduct();
});

final basketProductsStreamProvider = StreamProvider.autoDispose.family<List<BasketModel>, String?>((ref, uid) {
  final basketProductRepository = ref.watch(basketProductRepositoryProvider(uid));
  return basketProductRepository.getBasketProducts();
});

final basketProductRepositoryProvider = Provider.family<BasketRepository, String?>((ref, uid) {
  return BasketRepository(uid: uid);
});