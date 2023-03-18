import 'package:dio/dio.dart';
import 'package:news_app/core/constants/news_api_constants.dart';

/// Adds apiKey in query parameters in all API requests
class NewsKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apiKey'] = NewsApiConstants.key;
    return handler.next(options);
  }
}
