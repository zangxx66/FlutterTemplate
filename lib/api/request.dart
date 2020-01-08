import 'package:dio/dio.dart';

class Request {

  Dio _dio = Dio(BaseOptions(
    baseUrl: "https://swapi.co/api",
    connectTimeout: 5000,
    receiveTimeout: 3000
  ));

  Response _response;

  dynamic get(String url,var params) async {
    _response = await _dio.get(url,queryParameters: params);
    return _response.data;
  }

  dynamic post(String url,var params) async {
    _response = await _dio.post(url,data:params);
    return _response.data;
  }
}