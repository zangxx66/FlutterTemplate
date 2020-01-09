import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  bool _selected;
  var _onchange;
  CheckboxWidget(bool selected, var onchange) {
    _selected = selected;
    _onchange = onchange;
  }

  @override
  State<StatefulWidget> createState() {
    return new _CheckboxWidget(_selected, _onchange);
  }
}

class _CheckboxWidget extends State<CheckboxWidget> {
  bool _selected;
  var _onchange;
  _CheckboxWidget(bool selected, var onchange) {
    _selected = selected;
    _onchange = onchange;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: CheckboxListTile(
            title: Text("checkbox1"),
            value: _selected,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: (value) {
              _onchange(value);
              setState(() {
                _selected = value;
              });
            },
          ),
        ),
        Flexible(
          child: CheckboxListTile(
            title: Text("checkbox2"),
            value: !_selected,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: (value) {
              _onchange(value);
              setState(() {
                _selected = !value;
              });
            },
          ),
        )
      ],
    );
  }
}
