import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/logic/global_variables.dart';
import 'package:taskaty/providers/bottom_bar_provider.dart';
import 'dart:async';
import 'package:taskaty/screens/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> Bottom_Bar_Provider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Taskaty',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(title: 'Taskaty'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Start())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Global_Variables.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/taskaty_logo2.png',
              width: Global_Variables.getDeviceWidth(context)/1.5,
              height: Global_Variables.getDeviceHeight(context)/1.5,
            ),
          ],
        )
    );
  }
}
