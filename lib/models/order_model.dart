import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class OrderModel implements BaseModel<OrderModel> {

  final String? uid;
  final List? products;
  final double? totalPrice;
  final String? customerUid;
  final String? status;
  final DateTime? createdAt;
  final String? orderNumber;
  final String? note;


  OrderModel({
    this.uid, 
    this.totalPrice,
    this.products, 
    this.customerUid, 
    this.status,
    this.createdAt,
    this.orderNumber,
    this.note
  });

  @override
  OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json["totalPrice"] as double?,
    products: json["products"] as List?,
    uid: json["uid"] as String?,
    status: json["status"] as String?,
    customerUid: json["customerUid"] as String?,
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"] as String) : null,
    orderNumber: json["orderNumber"] as String?,
    note: json["note"] as String?

  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "totalPrice": totalPrice,
    "products": products,
    "uid": uid,
    "customerUid": customerUid,
    "status": status,
    "createdAt": createdAt,
    "orderNumber": orderNumber,
    "note": note
  };
}