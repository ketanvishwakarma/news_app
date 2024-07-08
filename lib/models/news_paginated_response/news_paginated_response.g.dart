// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsPaginatedResponseImpl _$$NewsPaginatedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsPaginatedResponseImpl(
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsPaginatedResponseImplToJson(
        _$NewsPaginatedResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
