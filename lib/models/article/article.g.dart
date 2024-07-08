// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String,
      description: json['description'] as String?,
      author: json['author'] as String?,
      urlToImage: json['urlToImage'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'url': instance.url,
      'publishedAt': instance.publishedAt,
      'description': instance.description,
      'author': instance.author,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
