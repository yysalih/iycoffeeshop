import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/user_model.dart';

class DrinkRepository {
  final String _uid;

  DrinkRepository({String? uid})
      : _uid = uid ?? "";



  Stream<ProductModel> getDrink() {
    return firebaseFirestore.collection("drinks").doc(_uid).snapshots().map((event) {
      return ProductModel().fromJson(event.data()!);
    });
  }

  Stream<List<ProductModel>> getDrinks() {
    return firebaseFirestore.collection("drinks").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => ProductModel().fromJson(e.data())).toList();
    });
  }

}

final drinkStreamProvider = StreamProvider.autoDispose.family<ProductModel, String?>((ref, uid) {
  final drinkRepository = ref.watch(drinkRepositoryProvider(uid));
  return drinkRepository.getDrink();
});

final drinksStreamProvider = StreamProvider.autoDispose.family<List<ProductModel>, String?>((ref, uid) {
  final drinkRepository = ref.watch(drinkRepositoryProvider(uid));
  return drinkRepository.getDrinks();
});

final drinkRepositoryProvider = Provider.family<DrinkRepository, String?>((ref, uid) {
  return DrinkRepository(uid: uid);
});