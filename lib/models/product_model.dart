import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class ProductModel implements BaseModel<ProductModel> {

  final String? uid;
  final String? name;
  final String? description;
  final String? image;
  final String? type;
  final double? price;


  ProductModel({
    this.uid, this.name, this.image,
    this.type, this.price,
    this.description,
  });

  @override
  ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
    price: json["price"] as double?,
    description: json["description"] as String?,
    image: json["image"] as String?,
    uid: json["uid"] as String?,
    name: json["name"] as String?,
    type: json["type"] as String?,

  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "price": price,
    "description": description,
    "image": image,
    "uid": uid,
    "name": name,
    "type": type,
  };
}