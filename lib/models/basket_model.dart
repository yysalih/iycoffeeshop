import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class BasketModel implements BaseModel<BasketModel> {

  final String? uid;
  final String? productUid;
  final double? price;
  final double? totalPrice;
  final int? piece;


  BasketModel({
    this.uid,
    this.price, this.totalPrice,
    this.productUid, this.piece
  });

  @override
  BasketModel fromJson(Map<String, dynamic> json) => BasketModel(
    totalPrice: json["totalPrice"] as double?,
    price: json["price"] as double?,
    productUid: json["productUid"] as String?,
    uid: json["uid"] as String?,
    piece: json["piece"] as int?,

  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "totalPrice": totalPrice,
    "productUid": productUid,
    "uid": uid,
    "price": price,
    "piece": piece,
  };
}