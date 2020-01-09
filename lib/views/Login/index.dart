import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Ricardo/widget/ExitDialog/index.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(title: Text("Login"), automaticallyImplyLeading: false),
        body: ExitDialog(Scaffold(
          body: TextForm(),
        )));
  }
}

class TextForm extends StatefulWidget {
  const TextForm({Key key}) : super(key: key);

  @override
  TextFormState createState() => TextFormState();
}

class User {
  String username = "";
  String password = "";
}

class TextFormState extends State<TextForm> {
  final GlobalKey<ScaffoldState> _scafflodKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showInSnackBar(String value) {
    _scafflodKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  String _validUserName(String value) {
    if (value.isEmpty) {
      return "Enter your username";
    }
    return null;
  }

  String _validPwd(String value) {
    if (value.isEmpty) {
      return "Enter your password";
    }
    return null;
  }

  void _submit() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true;
    } else {
      form.save();
      // do something
      //
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    final cursorColor = Theme.of(context).cursorColor;
    const sizedBoxSpace = SizedBox(height: 24);
    User user = User();

    return Scaffold(
        key: _scafflodKey,
        body: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sizedBoxSpace,
                  TextFormField(
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                        filled: true,
                        icon: Icon(Icons.person),
                        labelText: "Username"),
                    onSaved: (value) {
                      user.username = value;
                    },
                    validator: _validUserName,
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    cursorColor: cursorColor,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        icon: Icon(Icons.https),
                        suffixIcon: GestureDetector(
                          dragStartBehavior: DragStartBehavior.down,
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    onSaved: (value) {
                      user.password = value;
                    },
                    validator: _validPwd,
                  ),
                  sizedBoxSpace,
                  Center(
                    child: RaisedButton(
                      textTheme: ButtonTextTheme.primary,
                      color: Theme.of(context).accentColor,
                      child: const Text("Submit"),
                      onPressed: _submit,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
