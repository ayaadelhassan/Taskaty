import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/widgets/bottom_bar.dart';
import 'package:taskaty/widgets/circular_progress_bar.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////
    double pic_size = Global_Variables.getDeviceWidth(context)/5;
    double name_font_size = Global_Variables.getDeviceWidth(context)/15;
    //////////////////////////////////////////////////
     return Scaffold(
       //bottom bar
        bottomNavigationBar: Bottom_Bar(),
      body: Container(
        color: Global_Variables.grey,
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
                new Cricular_Brogress_Bar(),
              ],
            ),
          )
        )
      )
    );

  }
}
