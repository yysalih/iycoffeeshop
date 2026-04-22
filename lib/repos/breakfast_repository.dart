import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class BreakfastRepository {
  final String _uid;

  BreakfastRepository({String? uid})
      : _uid = uid ?? "";



  Stream<ProductModel> getBreakfast() {
    return firebaseFirestore.collection("breakfasts").doc(_uid).snapshots().map((event) {
      return ProductModel().fromJson(event.data()!);
    });
  }

  Stream<List<ProductModel>> getBreakfasts() {
    return firebaseFirestore.collection("breakfasts").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => ProductModel().fromJson(e.data())).toList();
    });
  }

}

final breakfastStreamProvider = StreamProvider.autoDispose.family<ProductModel, String?>((ref, uid) {
  final breakfastRepository = ref.watch(breakfastRepositoryProvider(uid));
  return breakfastRepository.getBreakfast();
});

final breakfastsStreamProvider = StreamProvider.autoDispose.family<List<ProductModel>, String?>((ref, uid) {
  final breakfastRepository = ref.watch(breakfastRepositoryProvider(uid));
  return breakfastRepository.getBreakfasts();
});

final breakfastRepositoryProvider = Provider.family<BreakfastRepository, String?>((ref, uid) {
  return BreakfastRepository(uid: uid);
});