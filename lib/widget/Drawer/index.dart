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
            new UserAccountsDrawerHeader(
              accountName: new Text('Ricardo'),
                   accountEmail: new Text('thespirit@vip.qq.com'),
                   currentAccountPicture: new CircleAvatar(
                     backgroundColor: Colors.black26,
                     child: new Text('R'),
                   ),
                   decoration: new BoxDecoration(color: Theme.of(context).accentColor),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
            ListTile(
              title:Text("ListView"),
              onTap:() {
                Navigator.of(context).pushReplacementNamed("/listview");
              }
            ),
            ListTile(
              title: Text("Form"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/form");
              },
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