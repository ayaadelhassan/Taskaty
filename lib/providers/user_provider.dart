import 'package:flutter/material.dart';
import 'package:taskaty/models/user.dart';

class User_Provider with ChangeNotifier {
  User user;

  void initialize(
      {String id,
        String name,
        String email,
        String password,
        String imageUrl}) {
    user = new User(id: id, name: name, email: email, password: password, imageUrl: imageUrl);
    notifyListeners();
  }

  void endUser() {
    user = null;
    notifyListeners();
  }
}
