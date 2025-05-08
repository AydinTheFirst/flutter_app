import 'package:dio/dio.dart';
import 'package:flutter_app/env.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    init();
  }

  void init() {
    dio.options.baseUrl = EnvConfig.baseUrl;
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}

DioClient dioClient = DioClient(Dio());
