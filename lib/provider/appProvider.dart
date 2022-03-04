import 'package:flutter/material.dart';
import 'package:twe/models/booking.dart';
import 'package:twe/models/coffee.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';

class AppProvider with ChangeNotifier {
  String userId = "";
  String uid = "";
  bool isLogin = false;
  List<MentorModel> listMentorInvite = [];

  BookingModel booking = BookingModel(id: "111111111");

  void setIsLogin() {
    isLogin = true;
    notifyListeners();
  }

  void setIsLogout() {
    isLogin = false;
    notifyListeners();
  }

  void setListMentorInvite(mentor) {
    listMentorInvite.add(mentor);
    notifyListeners();
  }

  void setListMentorInviteEmpty() {
    listMentorInvite = [];
    notifyListeners();
  }

  void removeMentor(mentor) {
    listMentorInvite.remove(mentor);
    notifyListeners();
  }

  void setUserLogin(id) {
    userId = id;
    notifyListeners();
  }

  void setUid(id) {
    uid = id;
    notifyListeners();
  }

  void setBookingSubjct(sub) {
    booking.subject = sub;
    notifyListeners();
  }

  void setBookingMajor(major) {
    booking.major = major;
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

  void setBookingPrice(price) {
    booking.price = price;
    notifyListeners();
  }

  void setBookingCoffee(coffee) {
    booking.coffee = coffee;
    notifyListeners();
  }

  void setBookingUserId(id) {
    booking.userId = id;
    notifyListeners();
  }

  bool get getIsLogin => isLogin;
  List<MentorModel> get getListMentorInvite => listMentorInvite;
  String get getUserId => userId;
  String get getUid => uid;
  int get getBookingSlot => booking.slot;
  CoffeeModel get getBookingCoffee => booking.coffee;
  String get getBookingUserId => booking.userId;
  String get getBookingDate => booking.date;
  String get getBookingMentorId => booking.mentorId;
  SubjectModel get getBookingSubject => booking.subject;
  String get getBookingMajor => booking.major;
  double get getBookingPrice => booking.price;
  BookingModel get getBooking => booking;
}
