import 'package:dio/dio.dart';

import 'api_interceptors.dart';

/// Creates and configures a Dio instance
/// Use [DioFactory.create()] to get a configured Dio instance
class DioFactory {
  DioFactory._();
  static Dio? _dio;

  static Dio create({
    required final String baseUrl,
    required final Future<String?> Function() getToken,
    final Duration timeout = const Duration(seconds: 30),
    final bool enableLogging = true,
  }) {
    if (_dio != null) return _dio!;
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio!.interceptors.addAll([
      AuthInterceptor(getToken: getToken),
      if (enableLogging) LoggerInterceptor(),
    ]);

    return _dio!;
  }
}
