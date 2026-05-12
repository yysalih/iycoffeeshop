import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class CartItemModel implements BaseModel<CartItemModel> {

  final String? uid;
  final String? productUid;
  final double? price;
  final double? totalPrice;
  final int? piece;
  final String? type;


  const CartItemModel({
    this.uid,
    this.price, 
    this.totalPrice,
    this.productUid, 
    this.piece,
    this.type
  });

  @override
  CartItemModel fromJson(Map<String, dynamic> json) => CartItemModel(
    totalPrice: json["totalPrice"] as double?,
    price: json["price"] as double?,
    productUid: json["productUid"] as String?,
    uid: json["uid"] as String?,
    piece: json["piece"] as int?,
    type: json["type"] as String?,

  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "totalPrice": totalPrice,
    "productUid": productUid,
    "uid": uid,
    "price": price,
    "piece": piece,
    "type": type
  };

  CartItemModel copyWith({
    String? uid,
    String? productUid,
    double? price,
    double? totalPrice,
    int? piece
  }) => CartItemModel(
    uid: uid ?? this.uid,
    productUid: productUid ?? this.productUid,
    price: price ?? this.price,
    totalPrice: totalPrice ?? this.totalPrice,
    piece: piece ?? this.piece,
    type: type ?? this.type
  );
}