import 'package:flutter/material.dart';
import 'package:Ricardo/views/Login/index.dart';
import 'package:Ricardo/views/Home/index.dart';
import 'package:Ricardo/views/ListView/index.dart';
import 'package:Ricardo/views/SplanshScreen/index.dart';
import 'package:Ricardo/views/Form/index.dart';

// Route separation
final Map<String, WidgetBuilder> routes = {
  "/":(context) => Home(),
  "/startup":(context) => SplanshScreen(),
  "/login":(context) => Login(),
  "/listview":(context) => ListViewPage(),
  "/form":(context) => FormPage()
};

final onGenerateRoute = (RouteSettings settings) {
  final name = settings.name;
  var builder = routes[name];

  if(builder == null){
    builder = (context) => throw Exception('Invalid route: ${settings.name}');
  }

  final route = MaterialPageRoute(
    builder: builder,
    settings: settings
  );

  return route;
};
