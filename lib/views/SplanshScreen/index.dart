import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Ricardo/views/Home/index.dart';

class SplanshScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplanshScreen();
  }
}

class _SplanshScreen extends State<SplanshScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 8);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder:(context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Image.asset(
        "assets/images/launch.jpg",
        width:double.infinity,
        height:double.infinity,
        fit:BoxFit.fill
      )
    );
  }
}