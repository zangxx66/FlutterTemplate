import 'package:flutter/material.dart';
import 'package:Ricardo/widget/Drawer/index.dart';
import 'package:Ricardo/widget/ExitDialog/index.dart';
import 'package:Ricardo/views/ListView/widget/listview.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListViewPage();
  }
}

class _ListViewPage extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      drawer: DrawerState(),
      body: ExitDialog(
        Scaffold(
          body: Listview()
        )
      ),
    );
  }
}
