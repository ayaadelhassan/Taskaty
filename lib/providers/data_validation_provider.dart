import 'package:flutter/material.dart';

class Data_Validation_Provider extends ChangeNotifier{
  String name_error_text = "";
  String email_error_text = "";
  String password_error_text = "";
  String new_task_title_text = "";
  String new_title_duedate = "Due Date";
  var new_title_color = Colors.red;
  bool new_title_remindme = false;

  bool name_validate = false;
  bool email_validate = false;
  bool password_validate = false;
  bool new_task_title_validate = false;


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
  ////////////////////////////////////
  void onNewTaskTitleEmpty() {
    new_task_title_text = "The title Is Required";
    new_task_title_validate = true;
    notifyListeners();
  }

  void onNewTaskTitleNoEmpty() {
    new_task_title_text = "";
    new_task_title_validate = false;
    notifyListeners();
  }
  ///////////////////////////////////////////////
  void onNewTaskDueDateChosen(String dd) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    String todaystr = "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    String tmwstr = "${tomorrow.year.toString()}-${tomorrow.month.toString().padLeft(2, '0')}-${tomorrow.day.toString().padLeft(2, '0')}";

    if(dd==todaystr){
      new_title_duedate = "Today";
    }else if(dd==tmwstr){
      new_title_duedate = "Tomorrow";
    }else{
      new_title_duedate = dd;
    }
    notifyListeners();
  }
  /////////////////////////////////////////////////
  void onNewTaskColorChange(Color cr) {
    new_title_color = cr;
    notifyListeners();
  }
  ///////////////////////////////////////////////
  void onNewTaskReminMe(bool rm) {
    new_title_remindme = rm;
    notifyListeners();
  }

  ////////////////////////////////////////////////
  void onNewTaskRestore() {
    new_task_title_text = "";
    new_title_duedate = "Due Date";
    new_title_color = Colors.red;
    new_title_remindme = false;
    new_task_title_validate = false;
    notifyListeners();
  }
}