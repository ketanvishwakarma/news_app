import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:news_app/models/news_paginated_response/source.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    required Source source,
    required String title,
    required String description,
    required String url,
    required String publishedAt,
    String? author,
    String? urlToImage,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
