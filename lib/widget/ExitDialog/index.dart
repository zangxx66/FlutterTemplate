import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitDialog extends StatefulWidget {
  Scaffold _scaffold;
  ExitDialog(Scaffold scaffold) {
    this._scaffold = scaffold;
  }
  @override
  State<StatefulWidget> createState() {
    return new _ExitDialog(this._scaffold);
  }
}

class _ExitDialog extends State<ExitDialog> {
  Scaffold _scaffold;
  _ExitDialog(Scaffold scaffold) {
    this._scaffold = scaffold;
  }
  int _lastClickTime = 0;
  Future<bool> _onBackPressed() {
    int nowTime = new DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return SystemChannels.platform.invokeMethod("SystemNavigator.pop");
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Click again to exist!.')));
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      return new Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: this._scaffold,
    );
  }
}
