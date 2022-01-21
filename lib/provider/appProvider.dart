import 'package:flutter/material.dart';
import 'package:twe/models/booking.dart';

class AppProvider with ChangeNotifier {
  String userId = "";
  int mentorId = 0;

  BookingModel booking = BookingModel(id: 111111111);

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

  String get getUserId => userId;
  int get getBookingSlot => booking.slot;
  int get getBookingCoffee => booking.coffeeId;
  int get getBookingUserId => booking.userId;
  String get getBookingDate => booking.date;
  int get getBookingMentorId => booking.mentorId;
}
