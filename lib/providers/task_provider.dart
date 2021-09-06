import 'package:flutter/material.dart';
import 'package:taskaty/models/task.dart';

class Task_Provider with ChangeNotifier {
 List<Task> mytasks = [];

void addTask(String id,String title,String duedate,String desc,bool done,Color color,bool remindme){
Task t = new Task(id:id,title: title, duedate: duedate,desc: desc, done: done,color: color,remindme: remindme);
mytasks.add(t);
notifyListeners();
 }
}
