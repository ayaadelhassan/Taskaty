import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/logic/data_validations_frontend.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/providers/data_validation_provider.dart';
import 'package:taskaty/providers/user_provider.dart';

import 'home.dart';

class SignUp extends StatelessWidget {
  final name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double font_size = Global_Variables.getDeviceWidth(context) / 14;
    double button_width = Global_Variables.getDeviceWidth(context) / 1.5;
    double button_height = Global_Variables.getDeviceWidth(context) / 5;
    return Scaffold(
        body: Container(
            color: Global_Variables.grey,
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text(
                    "CREATE YOUR ACCOUNT",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: font_size),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: name_controller,
                      decoration: InputDecoration(
                        errorText: Provider.of<Data_Validation_Provider>(context)
                                .name_validate
                            ? Provider.of<Data_Validation_Provider>(context)
                                .name_error_text
                            : null,
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
                      controller: email_controller,
                      decoration: InputDecoration(
                        errorText: Provider.of<Data_Validation_Provider>(context)
                                .email_validate
                            ? Provider.of<Data_Validation_Provider>(context)
                                .email_error_text
                            : null,
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
                      controller: password_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: Provider.of<Data_Validation_Provider>(context)
                                .password_validate
                            ? Provider.of<Data_Validation_Provider>(context)
                                .password_error_text
                            : null,
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
                        child: Text("Signup".toUpperCase(),
                            style: TextStyle(
                                fontSize: font_size,
                                color: Global_Variables.grey)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Global_Variables.orange),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(
                                            color: Global_Variables.grey)))),
                        onPressed: () => {
                               if(Data_Validations_Front.checkEmpty(
                                  name_controller.text.isEmpty,
                                  email_controller.text.isEmpty,
                                  password_controller.text.isEmpty,
                                  context) &&
                          Data_Validations_Front.checkValidity(
                              name_controller.text,
                              email_controller.text,
                              password_controller.text,
                              context)) {
                                 Provider.of<User_Provider>(context, listen: false).initialize(id:"1",name: name_controller.text,email: email_controller.text,password:password_controller.text,imageUrl: null),
                                 Get.to(() => Home())
                               }
                            }
                            ),
                  )
              ],
            ),
                ))));
  }
}
