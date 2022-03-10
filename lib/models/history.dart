import 'package:flutter/material.dart';
import 'package:twe/models/location.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';

class HistoryModel {
  String? id;
  int? slot;
  String? date;
  String? subjectName;
  // MajorModel? major;
  String? mentor;
  // CoffeeModel? coffee;

  HistoryModel({
    this.id,
    // this.coffee,
    // this.major,
    this.subjectName,
    this.date,
    this.mentor,
    this.slot,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['sessionId'],
      date: json['date'],
      subjectName: json['subjectName'],
      mentor: json['mentorName'],
      slot: json['slot'],
    );
  }
}
