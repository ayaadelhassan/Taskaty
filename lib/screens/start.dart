import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/screens/login.dart';
import 'package:taskaty/screens/signup.dart';
class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double pic_size = Global_Variables.getDeviceWidth(context)/1.5;
    double font_size = Global_Variables.getDeviceWidth(context)/13;
    double button_width = Global_Variables.getDeviceWidth(context)/1.5;
    double button_height = Global_Variables.getDeviceWidth(context)/5;

    return Scaffold(
        body: Container(
            color: Global_Variables.grey,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: pic_size,
                      height: pic_size,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:AssetImage(
                                'assets/logos/taskaty_logo3.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),

                    SizedBox(
                      width: button_width,
                      height: button_height,
                      child: ElevatedButton(
                          child: Text(
                              "Login".toUpperCase(),
                              style: TextStyle(fontSize: font_size, color: Global_Variables.orange)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Global_Variables.grey),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Global_Variables.orange)
                                  )
                              )
                          ),
                          onPressed: () => {
                            Get.to(() => Login())
                          }
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: button_width,
                      height: button_height,
                      child: ElevatedButton(
                          child: Text(
                              "Signup".toUpperCase(),
                              style: TextStyle(fontSize: font_size, color: Global_Variables.grey)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Global_Variables.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Global_Variables.grey)
                                  )
                              )
                          ),
                          onPressed: () => {
                            Get.to(() => SignUp())
                          }
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
