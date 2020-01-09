import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Ricardo/widget/Drawer/index.dart';
import 'package:Ricardo/widget/ExitDialog/index.dart';
import 'package:Ricardo/views/Form/widget/TextInput.dart';
import 'package:Ricardo/views/Form/widget/RadioWidget.dart';
import 'package:Ricardo/views/Form/widget/CheckboxWidget.dart';
import 'package:Ricardo/views/Form/widget/SwitchWidget.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FormPage();
  }
}

class _FormPage extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      drawer: DrawerState(),
      body: ExitDialog(
        Scaffold(
          body: _TextForm(),
        )
      ),
    );
  }
}

class _TextForm extends StatefulWidget {
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<_TextForm>  {
  final GlobalKey<ScaffoldState> _scafflodKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _showInSnackBar(String value) {
    _scafflodKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _submit() {
    final form = _formKey.currentState;
    if(!form.validate()){
      _autoValidate = true;
    }else{
      // do something
      // 
      _showInSnackBar("You clicked submit button!");
    }
  }

  @override
  Widget build(BuildContext context) {
    const _sizeBoxSpace = SizedBox(height: 24);
    bool _obscureText = true;

    String _validate(String value) {
      if(value.isEmpty) {
        return "Please enter some words";
      }
      return null;
    }

    // raido
    String rvalue = "one";
    void _radio(String value) {
      rvalue = value;
    }

    // checkbox
    bool checkvalue = true;
    void _check(bool value) {
      checkvalue = value;
    }

    // switch
    bool switchvalue = true;
    void _switch(bool value) {
      switchvalue = value;
    }

    return Scaffold(
      key: _scafflodKey,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _sizeBoxSpace,
                TextInput(
                  "TextInput",
                ),
                _sizeBoxSpace,
                TextInput(
                  "TextInputValidate",
                  validator: _validate,
                ),
                _sizeBoxSpace,
                TextInput(
                  "Password",
                  validator: _validate,
                  obscureText: _obscureText,
                ),
                _sizeBoxSpace,
                RadioWidget(rvalue, _radio),
                _sizeBoxSpace,
                CheckboxWidget(checkvalue, _check),
                _sizeBoxSpace,
                SwitchWidget(switchvalue, _switch),
                _sizeBoxSpace,
                Center(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textTheme: ButtonTextTheme.primary,
                    child: Text("Submit"),
                    onPressed: _submit,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}