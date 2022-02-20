import 'package:flutter/material.dart';

class MentorModel {
  String? id;
  String? fullname;
  String? address;
  String? description;
  String? phone;
  String? image;
  String? sex;
  int? price;
  String? birthday;
  bool? status;
  int? rate;
  List<dynamic>? listMajor;

  MentorModel(
      {this.id,
      this.fullname,
      this.address,
      this.description,
      this.sex,
      this.phone,
      this.price,
      this.image,
      this.birthday,
      this.status,
      this.rate,
      this.listMajor});

  factory MentorModel.fromJson(Map<String, dynamic> json) {
    return MentorModel(
      id: json['id'],
      fullname: json['fullname'],
      address: json['address'],
      description: json['description'],
      sex: json['sex'],
      phone: json['phone'],
      price: json['price'],
      image: json['image'],
      birthday: json['birthday'],
      rate: json['rate'],
      status: json['status'],
      listMajor: json['listMajor'],
    );
  }
}
