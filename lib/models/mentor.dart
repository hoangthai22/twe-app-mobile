import 'package:flutter/material.dart';

class MentorModel {
  int id;
  String mentorName;
  String description;
  String avatar;
  double rate;
  List<String> skill;

  MentorModel(
      {required this.id,
      required this.mentorName,
      required this.description,
      required this.avatar,
      required this.rate,
      required this.skill});
}
