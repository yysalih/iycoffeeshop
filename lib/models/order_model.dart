import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class OrderModel implements BaseModel<OrderModel> {

  final String? uid;
  final List? products;
  final double? totalPrice;
  final String? who;


  OrderModel({
    this.uid, this.totalPrice,
    this.products, this.who
  });

  @override
  OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json["totalPrice"] as double?,
    products: json["products"] as List?,
    uid: json["uid"] as String?,
    who: json["who"] as String?,

  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "totalPrice": totalPrice,
    "products": products,
    "uid": uid,
    "who": who,
  };
}