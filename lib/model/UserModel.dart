import 'package:flutter/material.dart';

class UserModel{
  final String email;
  final String password;

  UserModel({this.email,this.password});

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['name'],
        password=json['password'];
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}