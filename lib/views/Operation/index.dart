import 'package:flutter/material.dart';
import 'package:Ricardo/widget/Drawer/index.dart';

class Operation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OperationState();
  }
}

class _OperationState extends State<Operation> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Operation")),
      drawer: DrawerState(),
      body: Center(
      child: Text("This is Operation Page"),
    ));
  }
}