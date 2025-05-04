import 'package:dio/dio.dart';
import 'package:flutter_app/env.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      headers: {'Authorization': "Bearer ${storage.read('token')}"},
    ),
  );
});
