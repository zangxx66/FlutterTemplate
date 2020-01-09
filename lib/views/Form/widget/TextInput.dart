import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  String _label = "TextInput";
  var _validate;
  bool _obscureText = true;

  TextInput(String label,{var validator,bool obscureText}){
    _label = label;
    _validate = validator;
    _obscureText = obscureText;
  }
  @override
  State<StatefulWidget> createState() {
    return new _TextInput(_label,validator: _validate,obscureText: _obscureText);
  }
}

class _TextInput extends State<TextInput> {
  String _label = "TextInput";
  var _validate;
  bool _obscureText = true;

  _TextInput(String label,{var validator,bool obscureText}){
    _label = label;
     _validate = validator;
     _obscureText = obscureText;
  }
  @override
  Widget build(BuildContext context) {
    final _cursorColor = Theme.of(context).cursorColor;

    return TextFormField(
      cursorColor: _cursorColor,
      obscureText: _obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        labelText: _label
      ),
      validator: _validate ?? null,
    );
  }
}