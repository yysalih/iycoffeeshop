import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import '../models/user_model.dart';

class UserRepository {
  final String _uid;

  UserRepository({String? uid})
      : _uid = uid ?? "";

  Stream<UserModel> getUser() {
    return firebaseFirestore.collection("users").doc(_uid).snapshots().map((event) {
      return UserModel().fromJson(event.data()!);
    });
  }

  Stream<List<UserModel>> getUsers() {
    return firebaseFirestore.collection("users").orderBy(_uid, descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((e) => UserModel().fromJson(e.data())).toList();
    });
  }

}

final userStreamProvider = StreamProvider.autoDispose.family<UserModel, String?>((ref, uid) {
  final userRepository = ref.watch(userRepositoryProvider(uid));
  return userRepository.getUser();
});

final usersStreamProvider = StreamProvider.autoDispose.family<List<UserModel>, String?>((ref, uid) {
  final userRepository = ref.watch(userRepositoryProvider(uid));
  return userRepository.getUsers();
});

final userRepositoryProvider = Provider.family<UserRepository, String?>((ref, uid) {
  return UserRepository(uid: uid);
});