import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}

class DioHelperShop {
  static late Dio dioShop;
// email: abdullah.ali@gmail.com
// password: 123456

  static init() {
    dioShop = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dioShop.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token?? '',
    };

    return await dioShop.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    print(dioShop.toString()); // dioShop.toString()=null
    dioShop.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token?? '',
    };
    return dioShop.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    print(dioShop.toString()); // dioShop.toString()=null
    dioShop.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token?? '',
    };
    return dioShop.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
