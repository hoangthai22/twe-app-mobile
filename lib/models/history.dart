import 'package:flutter/material.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';

class HistoryModel {
  int id;
  int slot;
  String date;
  SubjectModel subject;
  MajorModel major;
  MentorModel mentor;

  CoffeeModel coffee;

  HistoryModel({
    required this.id,
    required this.coffee,
    required this.major,
    required this.subject,
    required this.date,
    required this.mentor,
    required this.slot,
  });
}
