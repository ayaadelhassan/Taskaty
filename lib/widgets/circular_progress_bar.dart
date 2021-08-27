import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskaty/logic/global_variables.dart';
class Cricular_Brogress_Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var radius = Global_Variables.getDeviceWidth(context)/2;
    var font_size = Global_Variables.getDeviceWidth(context)/10;
    return CircularPercentIndicator(
      radius: radius,
      animation: true,
      animationDuration: 1200,
      lineWidth: 12,
      percent: 0.75,
      center: new Text(
        "3/4",
        style:
        new TextStyle(fontWeight: FontWeight.bold, fontSize: font_size, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Global_Variables.light_grey,
      progressColor: Global_Variables.dark_orange,
    );
  }
}
