import 'package:flutter/material.dart';

class Bottom_Bar_Provider extends ChangeNotifier{
  int _selectedIndex = 0;

  int get getSelectedIndex {
    return _selectedIndex;
  }
  void onItemTapped(int index) {
      _selectedIndex = index;
      print(_selectedIndex);
      notifyListeners();
  }
}