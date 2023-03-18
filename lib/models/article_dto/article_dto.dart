import 'package:hive/hive.dart';

part 'article_dto.g.dart';

@HiveType(typeId: 0)
class ArticleDto extends HiveObject {
  ArticleDto({
    required this.sourceName,
    required this.title,
    required this.url,
    required this.publishedAt,
    this.description,
    this.author,
    this.urlToImage,
    this.content,
  });

  @HiveField(0)
  String sourceName;

  @HiveField(1)
  String title;

  @HiveField(2)
  String url;

  @HiveField(3)
  String publishedAt;

  @HiveField(4)
  String? description;

  @HiveField(5)
  String? author;

  @HiveField(6)
  String? urlToImage;

  @HiveField(7)
  String? content;
}
