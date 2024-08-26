import 'package:dio/dio.dart';
import 'dart:developer';
class ApiService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
          options: Options(responseType: ResponseType.json, method: "GET"))
        .then((value){
      //log(value.toString());
      return value;
      });
  }
}