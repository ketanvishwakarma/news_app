import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/article_dto/article_dto.dart';

@lazySingleton
class BookmarkRepository {
  BookmarkRepository(this._box);

  final Box<ArticleDto> _box;

  Future<void> add(ArticleDto articleDto) async {
    await _box.put(articleDto.publishedAt, articleDto);
  }

  Future<void> remove(ArticleDto articleDto) async {
    await _box.delete(articleDto.publishedAt);
  }

  bool isStored(ArticleDto articleDto) {
    return _box.containsKey(articleDto.publishedAt);
  }

  Stream<List<ArticleDto>> watchArticleDto() {
    return _box.watch().map((_) => _box.values.toList());
  }
}
