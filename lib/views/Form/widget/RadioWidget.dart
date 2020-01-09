import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  String _value;
  var _onchange;
  RadioWidget(String value, var onchange) {
    _value = value;
    _onchange = onchange;
  }
  @override
  State<StatefulWidget> createState() {
    return new _RadioWidget(_value, _onchange);
  }
}

class _RadioWidget extends State<RadioWidget> {
  String _value = "";
  var _onchange;
  _RadioWidget(String value, var onchange) {
    _value = value;
    _onchange = onchange;
  }

  void _change(String value){
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: RadioListTile(
            title: Text("radio1"),
            value: "one",
            groupValue: _value,
            onChanged: (_value){
              _onchange(_value);
              _change(_value);
            },
            selected: true,
            controlAffinity: ListTileControlAffinity.platform,
          ),
        ),
        Flexible(
          child: RadioListTile(
            title: Text("radio2"),
            value: "two",
            groupValue: _value,
            onChanged: (_value){
              _onchange(_value);
              _change(_value);
            },
            selected: true,
            controlAffinity: ListTileControlAffinity.platform,
          ),
        )
      ],
    );
  }
}
