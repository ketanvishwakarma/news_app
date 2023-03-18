import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/article_dto/article_dto.dart';

@lazySingleton
class BookmarkRepository {
  BookmarkRepository(this._box);

  final Box<ArticleDto> _box;

  Future<void> add(ArticleDto articleDto) async {
    await _box.put(_getKey(articleDto), articleDto);
  }

  Future<void> remove(ArticleDto articleDto) async {
    await _box.delete(_getKey(articleDto));
  }

  bool isStored(ArticleDto articleDto) {
    return _box.containsKey(_getKey(articleDto));
  }

  List<ArticleDto> getArticleDtoList() {
    return _box.values.toList();
  }

  String _getKey(ArticleDto articleDto) {
    return articleDto.title + articleDto.publishedAt;
  }
}
