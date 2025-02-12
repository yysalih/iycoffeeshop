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


  UserModel({this.uid, this.name, this.image,
    this.email, this.token,
    this.lastname, this.phone,
    this.password,
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
  };

  String getDbFields() {
    return "token, image, lastname, uid, name, email, password, phone, isBroker, isCarrier, src, registration, psiko, licenseFront, licenseBack, idFront, idBack, contacts, lat, lng";
  }

  String getDbFieldsWithQuestionMark() {
    return "token = ?, image = ?, lastname = ?, uid = ?, name = ?, email = ?, password = ?, phone = ?,";
  }

  String get questionMarks => "?, ?, ?, ?, ?, ?, ?, ?";

  List getDbFormat() {
    return [
      token,
      image,
      lastname,
      uid,
      name,
      email,
      password,
      phone,
    ];
  }

}