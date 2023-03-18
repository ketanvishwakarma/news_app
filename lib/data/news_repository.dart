import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/news_api_constants.dart';
import 'package:news_app/core/network/source/news_client.dart';
import 'package:news_app/models/news_paginated_response/news_paginated_response.dart';

@lazySingleton
class NewsRepository {
  NewsRepository(this._client);

  final NewsApiClient _client;

  Future<NewsPaginatedResponse> getTopHeadlines(int page) async {
    final queryParameters = {
      'country': 'in',
      'page': page,
    };
    final response = await _client.get<Map<String, dynamic>>(
      NewsApiConstants.topHeadlines,
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      return NewsPaginatedResponse.fromJson(response.data!);
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<NewsPaginatedResponse> searchNews(String query) async {
    final queryParameters = {
      'q': query,
    };
    final response = await _client.get<Map<String, dynamic>>(
      NewsApiConstants.everything,
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      return NewsPaginatedResponse.fromJson(response.data!);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
