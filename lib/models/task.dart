import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final String duedate;
  final String desc;
  final bool done;
  final Color color;
  final bool remindme;

  Task({
    @required this.id,
    @required this.title,
    @required this.duedate,
    @required this.desc,
    @required this.done,
    @required this.color,
    @required this.remindme,
  });
}