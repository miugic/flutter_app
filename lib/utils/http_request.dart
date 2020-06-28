import 'dart:convert';
import 'package:dio/dio.dart';

class HttpRequest {
  static final Dio dio = Dio();

  static final Map<String, dynamic> headers = {
    'accept': 'application/json,*/*'
  };
  static final Options options = Options(headers: headers,contentType: 'application/json');


  static Future<T> get<T>(String url, Map<String, dynamic> params) async {
    // 2.发送网络请求
    try {
      Response response;
      if(params==null){
        response = await dio.get(url, options: options);
      }else{
        response = await dio.get(url, queryParameters: params, options: options);
      }
      return response.data;
    } on DioError catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  static Future<T> post<T>(String url, Map<String, dynamic> params) async {
    // 2.发送网络请求
    try {
      Response response;
      if(params==null){
        response = await dio.post(url, options: options);
      }else{
        response = await dio.post(url, data: json.encode(params), options: options);
      }
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

}
