import 'dart:developer';
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      responseType: ResponseType.json,
    ),
  );

  Future<dynamic> getMethod(String url) async {
    try {
      final response = await _dio.get(url);
      log('Response: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      return Future.error(e);
    } catch (e) {
      log('Unexpected error: $e');
      return Future.error(e);
    }
  }
}
