import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/source/source.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    required Source source,
    required String title,
    required String url,
    required String publishedAt,
    String? description,
    String? author,
    String? urlToImage,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

extension ArticleX on String {
  String get formatToDateTime {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(this));
  }
}
