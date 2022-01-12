import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String userId = "";

  void setUserLogin(id) {
    userId = id;
    notifyListeners();
  }

  String get getUserId => userId;
}
