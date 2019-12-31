import 'package:flutter/material.dart';

// Drawer widget
class DrawerState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DrawerState();
  }
}

class _DrawerState extends State<DrawerState> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Nickname"),
              decoration: BoxDecoration(
                color: Theme.of(context).cursorColor
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
            ListTile(
              title:Text("Operation"),
              onTap:() {
                Navigator.of(context).pushReplacementNamed("/operation");
              }
            ),
            ListTile(
              title:Text("Exit"),
              onTap: (){
                //do something
                // 
                Navigator.of(context).pushReplacementNamed("/login");
              }
            )
          ],
        )
    );
  }
}