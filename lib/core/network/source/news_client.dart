import 'package:dio/dio.dart';
import 'package:news_app/core/constants/news_api_constants.dart';
import 'package:news_app/core/network/source/news_key_interceptor.dart';

class NewsApiClient {
  NewsApiClient({
    required Dio dio,
  }) : _dio = dio {
    _dio
      ..options.baseUrl = NewsApiConstants.baseUrl
      ..interceptors.add(NewsKeyInterceptor());
  }

  final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }
}
