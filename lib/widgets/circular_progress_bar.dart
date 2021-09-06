import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskaty/logic/global_variables.dart';
class Cricular_Brogress_Bar extends StatelessWidget {
  final int total_number_of_tasks;
  final int finished_tasks;
  Cricular_Brogress_Bar(this.total_number_of_tasks, this.finished_tasks);
  @override
  Widget build(BuildContext context) {
    var radius = Global_Variables.getDeviceWidth(context)/2;
    var font_size = Global_Variables.getDeviceWidth(context)/10;
    return CircularPercentIndicator(
      radius: radius,
      animation: true,
      animationDuration: 1200,
      lineWidth: 12,
      percent: total_number_of_tasks==0? 0 : finished_tasks/total_number_of_tasks,
      center: new Text(
        "$finished_tasks/$total_number_of_tasks",
        style:
        new TextStyle(fontWeight: FontWeight.bold, fontSize: font_size, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Global_Variables.light_grey,
      progressColor: Global_Variables.dark_orange,
    );
  }
}
