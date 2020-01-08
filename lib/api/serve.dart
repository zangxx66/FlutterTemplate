import 'package:Ricardo/api/request.dart';

class Serve {
  dynamic getPeople(var params) async {
    dynamic response = await Request().get("/people",params);
    return response;
  }
}