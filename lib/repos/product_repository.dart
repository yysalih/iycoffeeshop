import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class ProductRepository {
  final String _uid;

  ProductRepository({String? uid})
      : _uid = uid ?? "";



  Stream<ProductModel> getProduct() {
    return firebaseFirestore.collection("products").doc(_uid).snapshots().map((event) {
      return ProductModel().fromJson(event.data()!);
    });
  }

  Stream<List<ProductModel>> getProducts() {
    return firebaseFirestore.collection("products").orderBy(_uid, descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((e) => ProductModel().fromJson(e.data())).toList();
    });
  }

}

final productStreamProvider = StreamProvider.autoDispose.family<ProductModel, String?>((ref, uid) {
  final productRepository = ref.watch(productRepositoryProvider(uid));
  return productRepository.getProduct();
});

final productsStreamProvider = StreamProvider.autoDispose.family<List<ProductModel>, String?>((ref, uid) {
  final productRepository = ref.watch(productRepositoryProvider(uid));
  return productRepository.getProducts();
});

final productRepositoryProvider = Provider.family<ProductRepository, String?>((ref, uid) {
  return ProductRepository(uid: uid);
});