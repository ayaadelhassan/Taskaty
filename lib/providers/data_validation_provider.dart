import 'package:flutter/material.dart';

class Data_Validation_Provider extends ChangeNotifier{
  String name_error_text = "";
  String email_error_text = "";
  String password_error_text = "";

  bool name_validate = false;
  bool email_validate = false;
  bool password_validate = false;

  void onNameEmpty() {
    name_error_text = "The Name Is Required";
    name_validate = true;
    notifyListeners();
  }

  void onNameNoEmpty() {
    name_error_text = "";
    name_validate = false;
    notifyListeners();
  }


  //////////////////////////////

  void onEmailEmpty() {
    email_error_text = "The Email Is Required";
    email_validate = true;
    notifyListeners();
  }

  void onEmailNotEmpty() {
    email_error_text = "";
    email_validate = false;
    notifyListeners();
  }

  void onEmailNotValid() {
    email_error_text = "Email is not valid";
    email_validate = true;
    notifyListeners();
  }

  void onEmailValid() {
    email_error_text = "";
    email_validate = false;
    notifyListeners();
  }

///////////////////////////////////
  void onPasswordEmpty() {
    password_error_text = "The Password Is Required";
    password_validate = true;
    notifyListeners();
  }

  void onPasswordNotEmpty() {
    password_error_text = "";
    password_validate = false;
    notifyListeners();
  }
}