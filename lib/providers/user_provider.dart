import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_provider.dart';

final userProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/user');
  return response.data;
});
