import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../error/exceptions.dart';

class DioClient {
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.tmdbBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        queryParameters: <String, dynamic>{
          'api_key': ApiConfig.tmdbApiKey,
        },
        headers: <String, dynamic>{
          'Accept': 'application/json',
        },
      ),
    );
  }

  late final Dio _dio;

  Dio get dio => _dio;

  Never throwAsServerException(DioException error) {
    final int? status = error.response?.statusCode;
    final String message = error.response?.data is Map<String, dynamic> ? (error.response?.data['status_message']?.toString() ?? error.message ?? 'Unknown server error') : (error.message ?? 'Unknown server error');
    throw ServerException(message: message, statusCode: status);
  }
}
