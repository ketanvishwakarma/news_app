// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsPaginatedResponse _$$_NewsPaginatedResponseFromJson(
        Map<String, dynamic> json,) =>
    _$_NewsPaginatedResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsPaginatedResponseToJson(
        _$_NewsPaginatedResponse instance,) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
