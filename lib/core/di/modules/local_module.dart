import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/models/article_dto/article_dto.dart';

@module
abstract class LocalModule {
  @preResolve
  @lazySingleton
  Future<Box<ArticleDto>> get todoBox {
    return Hive.openBox<ArticleDto>('articleDto');
  }
}
