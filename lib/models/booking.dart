import 'package:flutter/material.dart';
import 'package:twe/models/location.dart';
import 'package:twe/models/subject.dart';

class BookingModel {
  late String id;
  late int slot;
  late String date;
  late SubjectModel subject;
  late String major;
  late double price;
  late String mentorId;
  late String userId;
  late CoffeeModel coffee;

  BookingModel({required this.id});
}
