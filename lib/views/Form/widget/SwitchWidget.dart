import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  bool _switch;
  var _onchange;
  SwitchWidget(bool argswitch,var onchange){
    _switch = argswitch;
    _onchange = onchange;
  }

  @override
  State<StatefulWidget> createState() {
    return new _SwitchWidget(_switch,_onchange);
  }
}

class _SwitchWidget extends State<SwitchWidget> {
  bool _switch;
  var _onchange;
  _SwitchWidget(bool argswitch,var onchange){
    _switch = argswitch;
    _onchange = onchange;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Switch"),
      value: _switch,
      onChanged: (value) {
        _onchange(value);
        setState(() {
          _switch = value;
        });
      },
    );
  }
}