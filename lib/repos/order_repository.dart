import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iycoffee/constants/app_constants.dart';
import 'package:iycoffee/models/basket_model.dart';
import 'package:iycoffee/models/product_model.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';

class OrderRepository {
  final String _uid;

  OrderRepository({String? uid})
      : _uid = uid ?? "";


  Stream<OrderModel> getOrder() {

    return firebaseFirestore.collection("users").doc(currentUserUid).collection("orders")
        .doc(_uid).snapshots().map((event) {
      return OrderModel().fromJson(event.data()!);
    });
  }

  Stream<List<OrderModel>> getOrders() {
    return firebaseFirestore.collection("users").doc(currentUserUid).collection("orders").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => OrderModel().fromJson(e.data())).toList();
    });
  }

}

final orderStreamProvider = StreamProvider.autoDispose.family<OrderModel, String?>((ref, uid) {
  final orderRepository = ref.watch(orderRepositoryProvider(uid));
  return orderRepository.getOrder();
});

final ordersStreamProvider = StreamProvider.autoDispose.family<List<OrderModel>, String?>((ref, uid) {
  final orderRepository = ref.watch(orderRepositoryProvider(uid));
  return orderRepository.getOrders();
});

final orderRepositoryProvider = Provider.family<OrderRepository, String?>((ref, uid) {
  return OrderRepository(uid: uid);
});