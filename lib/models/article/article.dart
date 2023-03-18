import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article_dto/article_dto.dart';
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

  const Article._();

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  factory Article.fromArticleDto(ArticleDto articleDto) {
    return Article(
      source: Source(name: articleDto.sourceName),
      title: articleDto.title,
      url: articleDto.url,
      publishedAt: articleDto.publishedAt,
      author: articleDto.author,
      content: articleDto.content,
      description: articleDto.description,
      urlToImage: articleDto.urlToImage,
    );
  }

  ArticleDto toArticleDto() {
    return ArticleDto(
      sourceName: source.name,
      title: title,
      url: url,
      publishedAt: publishedAt,
      author: author,
      content: content,
      description: description,
      urlToImage: urlToImage,
    );
  }
}

extension ArticleX on String {
  String get formatToDateTime {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(this));
  }
}
