// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String,
      author: json['author'] as String?,
      urlToImage: json['urlToImage'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'publishedAt': instance.publishedAt,
      'author': instance.author,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
