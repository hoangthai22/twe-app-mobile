import 'package:flutter/material.dart';

class CoffeeModel {
  String? id;
  String? name;
  String? description;
  String? street;
  String? distric;
  String? image;
  double? rate;

  CoffeeModel({
    required this.id,
    required this.name,
    required this.street,
    required this.distric,
    required this.description,
    required this.image,
     this.rate,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['id'],
      name: json['name'],
      street: json['street'],
      distric: json['distric'],
      description: json['description'],
      image: json['image'],
    );
  }
}
