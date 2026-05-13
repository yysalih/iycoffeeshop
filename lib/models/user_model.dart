import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

@JsonSerializable()
@immutable
class UserModel implements BaseModel<UserModel> {

  final String? uid;
  final String? name;
  final String? lastname;
  final String? image;
  final String? email;
  final String? token;
  final String? password;
  final String? phone;
  final List? favorites;
  final List? orders;
  final double? wallet;


  UserModel({
    this.uid, 
    this.name, 
    this.image,
    this.email, 
    this.token,
    this.lastname, 
    this.phone,
    this.password, 
    this.favorites, 
    this.orders,
    this.wallet
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"] as String?,
    lastname: json["lastname"] as String?,
    image: json["image"] as String?,
    uid: json["uid"] as String?,
    name: json["name"] as String?,
    email: json["email"] as String?,
    password: json["password"] as String?,
    phone: json["phone"] as String?,
    favorites: json["favorites"] as List?,
    orders: json["orders"] as List?,
    wallet: json["wallet"] as double?
  );
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    "token": token,
    "lastname": lastname,
    "image": image,
    "uid": uid,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "favorites": favorites,
    "orders": orders,
    "wallet": wallet
  };

  UserModel copyWith({
    String? uid,
    String? name,
    String? lastname,
    String? image,
    String? email,
    String? token,
    String? password,
    String? phone,
    List? favorites,
    List? orders,
    double? wallet
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      image: image ?? this.image,
      email: email ?? this.email,
      token: token ?? this.token,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      favorites: favorites ?? this.favorites,
      orders: orders ?? this.orders,
      wallet: wallet ?? this.wallet
    );
  }
}