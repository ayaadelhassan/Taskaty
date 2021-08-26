import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/providers/bottom_bar_provider.dart';
class Bottom_Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //////////////////Variables////////////////////////
    double icon_size_unselected = Global_Variables.getDeviceWidth(context)/14;
    double icon_size_selected = Global_Variables.getDeviceWidth(context)/13;
    /////////////////////////////////////////////////

    return BottomNavigationBar(
      unselectedIconTheme: IconThemeData(
        color: Global_Variables.light_grey,
        size: icon_size_unselected,
      ),
      selectedIconTheme: IconThemeData(
        size: icon_size_selected,
      ),
      unselectedItemColor: Global_Variables.light_grey,
      selectedItemColor: Global_Variables.dark_orange,
      backgroundColor: Global_Variables.dark_grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_sharp),
          label: 'Calender',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: Provider.of<Bottom_Bar_Provider>(context).getSelectedIndex, //New
      onTap: Provider.of<Bottom_Bar_Provider>(context, listen: false).onItemTapped,         //New
    );
  }
}
