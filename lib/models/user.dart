import 'package:flutter/material.dart';
import 'package:taskaty/models/task.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String imageUrl;
  final List<Task> tasksList = [];

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.imageUrl,
  });
}