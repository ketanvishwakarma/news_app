import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/key_constants.dart';
import 'package:news_app/core/constants/news_api_constants.dart';
import 'package:news_app/core/network/source/news_client.dart';
import 'package:news_app/models/news_paginated_response/news_paginated_response.dart';

@singleton
class NewsRepository {
  NewsRepository(this._client);

  final NewsApiClient _client;

  Future<NewsPaginatedResponse> getTopHeadlines(int page) async {
    return NewsPaginatedResponse.fromJson(sampleResponse);
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
}

// news_paginated_response
