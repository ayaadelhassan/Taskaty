import 'package:flutter/material.dart';
import 'package:taskaty/logic/global_variables.dart';
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double font_size = Global_Variables.getDeviceWidth(context)/14;
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
                      Text(
                          "CREATE YOUR ACCOUNT",
                        style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: font_size),
                      ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          labelText: 'User Name',
                          hintText: 'Enter Your Name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintStyle: TextStyle(
                            color: Global_Variables.orange,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        decoration: InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintStyle: TextStyle(
                            color: Global_Variables.orange,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Global_Variables.orange,
                            ),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hintStyle: TextStyle(
                            color: Global_Variables.orange,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
