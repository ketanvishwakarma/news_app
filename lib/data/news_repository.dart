import 'package:injectable/injectable.dart';
import 'package:news_app/core/network/source/news_client.dart';

@singleton
class NewsRepository {
  NewsRepository(this._client);

  final NewsApiClient _client;
}

// news_paginated_response
