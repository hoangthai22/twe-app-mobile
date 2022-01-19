import 'package:flutter/material.dart';

class CoffeeModel {
  int id;
  String coffeeName;
  String description;
  String address;
  String avatar;
  double rate;

  CoffeeModel({
    required this.id,
    required this.coffeeName,
    required this.address,
    required this.description,
    required this.avatar,
    required this.rate,
  });
}
