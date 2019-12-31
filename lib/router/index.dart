import 'package:flutter/material.dart';
import 'package:Ricardo/views/Login/index.dart';
import 'package:Ricardo/views/Home/index.dart';
import 'package:Ricardo/views/Operation/index.dart';

// Route separation
final Map<String, WidgetBuilder> routes = {
  "/":(context) => Home(),
  "/login":(context) => Login(),
  "/operation":(context) => Operation()
};

final onGenerateRoute = (RouteSettings settings) {
  final name = settings.name;
  var builder = routes[name];

  if(builder == null){
    builder = (context) => UnknowPage();
  }

  final route = MaterialPageRoute(
    builder: builder,
    settings: settings
  );

  return route;
};

class UnknowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text("404 Not Found!"),
      ),
    );
  }
}