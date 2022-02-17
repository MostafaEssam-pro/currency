import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://moho.glitch.me/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get('convert', queryParameters: query);
  }
}
