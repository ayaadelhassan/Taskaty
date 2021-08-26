import 'package:flutter/material.dart';
class Global_Variables {

  ////////function to get the current device's width
  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  ////////function to get the current device's height
  static double getDeviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }


  ////Colors:
  static var orange = const Color(0xffff914d);
  static var dark_orange = const Color(0xffED6612);
  static var light_grey = const Color(0xff929099);
  static var grey = const Color(0xff3b3940);
  static var dark_grey = const Color(0xff323136);
}