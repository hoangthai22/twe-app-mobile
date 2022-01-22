import 'package:flutter/material.dart';
import 'package:twe/models/booking.dart';
import 'package:twe/models/mentor.dart';

class AppProvider with ChangeNotifier {
  String userId = "";
  List<MentorModel> listMentorInvite = [];

  BookingModel booking = BookingModel(id: 111111111);

  void setListMentorInvite(mentor) {
    listMentorInvite.add(mentor);
    notifyListeners();
  }

  void romoveMentor(mentor) {
    listMentorInvite.remove(mentor);
    notifyListeners();
  }

  void setUserLogin(id) {
    userId = id;
    notifyListeners();
  }

  void setBookingMentorId(id) {
    booking.mentorId = id;
    notifyListeners();
  }

  void setBookingDate(date) {
    booking.date = date;
    notifyListeners();
  }

  void setBookingSlot(slot) {
    booking.slot = slot;
    notifyListeners();
  }

  void setBookingCoffee(id) {
    booking.coffeeId = id;
    notifyListeners();
  }

  void setBookingUserId(id) {
    booking.userId = id;
    notifyListeners();
  }

  List<MentorModel> get getListMentorInvite => listMentorInvite;
  String get getUserId => userId;
  int get getBookingSlot => booking.slot;
  int get getBookingCoffee => booking.coffeeId;
  int get getBookingUserId => booking.userId;
  String get getBookingDate => booking.date;
  int get getBookingMentorId => booking.mentorId;
}
