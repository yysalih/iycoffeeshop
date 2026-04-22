import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class CakeRepository {
  final String _uid;

  CakeRepository({String? uid})
      : _uid = uid ?? "";



  Stream<ProductModel> getCake() {
    return firebaseFirestore.collection("cakes").doc(_uid).snapshots().map((event) {
      return ProductModel().fromJson(event.data()!);
    });
  }

  Stream<List<ProductModel>> getCakes() {
    return firebaseFirestore.collection("cakes").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => ProductModel().fromJson(e.data())).toList();
    });
  }

}

final cakeStreamProvider = StreamProvider.autoDispose.family<ProductModel, String?>((ref, uid) {
  final cakeRepository = ref.watch(cakeRepositoryProvider(uid));
  return cakeRepository.getCake();
});

final cakesStreamProvider = StreamProvider.autoDispose.family<List<ProductModel>, String?>((ref, uid) {
  final cakeRepository = ref.watch(cakeRepositoryProvider(uid));
  return cakeRepository.getCakes();
});

final cakeRepositoryProvider = Provider.family<CakeRepository, String?>((ref, uid) {
  return CakeRepository(uid: uid);
});