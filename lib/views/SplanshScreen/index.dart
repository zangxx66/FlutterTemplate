import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Ricardo/views/Home/index.dart';
import 'package:Ricardo/widget/ExitDialog/index.dart';

class SplanshScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplanshScreen();
  }
}

class _SplanshScreen extends State<SplanshScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  Future requestPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      await PermissionHandler().openAppSettings();
    } else {
      startTime();
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ExitDialog(Scaffold(
      body: Image.asset("assets/images/launch.jpg",
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
    )));
  }
}
