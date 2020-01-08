import 'package:flutter/material.dart';
import 'package:Ricardo/widget/Drawer/index.dart';
import 'package:Ricardo/widget/ExitDialog/index.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: DrawerState(),
      body: ExitDialog(
        Scaffold(
          body: Center(
            child: Text("hello world!"),
          ),
        )
      )
      );
  }
}

