import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //the bottom app bar variables and function
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //getting size of the device's screen
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //////////////////////////////////////////////////
    double pic_size = width/5;
    double name_font_size = width/15;
    //////////////////////////////////////////////////
     return Scaffold(
       //bottom bar
        bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: IconThemeData(
            color: const Color(0xff929099),
          ),
          unselectedItemColor: const Color(0xff929099),
          selectedItemColor: const Color(0xffED6612),
          backgroundColor: const Color(0xff323136),
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
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,         //New
        ),
      body: Container(
        color: const Color(0xff3b3940),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       width: pic_size,
                       height: pic_size,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image:AssetImage(
                                 'assets/images/profile.jpg'),
                             fit: BoxFit.fill
                         ),
                       ),
                     ),
                     Text(
                       "Welcome back Aya!",
                       style: TextStyle(
                         fontSize: name_font_size,
                         color: Colors.white,
                       ),
                     )
                   ],
                 ),
              ],
            ),
          )
        )
      )
    );

  }
}
