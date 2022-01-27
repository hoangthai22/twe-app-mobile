import 'package:flutter/material.dart';
import 'package:twe/models/coffee.dart';

class BookingModel {
  late int id;
  late int slot;
  late String date;
  late String subject;
  late String major;
  late int mentorId;
  late int userId;
  late CoffeeModel coffee;

  BookingModel({required this.id});
}
