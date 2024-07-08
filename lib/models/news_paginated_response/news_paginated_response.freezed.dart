// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_paginated_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsPaginatedResponse _$NewsPaginatedResponseFromJson(
    Map<String, dynamic> json) {
  return _NewsPaginatedResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsPaginatedResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsPaginatedResponseCopyWith<NewsPaginatedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsPaginatedResponseCopyWith<$Res> {
  factory $NewsPaginatedResponseCopyWith(NewsPaginatedResponse value,
          $Res Function(NewsPaginatedResponse) then) =
      _$NewsPaginatedResponseCopyWithImpl<$Res, NewsPaginatedResponse>;
  @useResult
  $Res call({String? status, int? totalResults, List<Article>? articles});
}

/// @nodoc
class _$NewsPaginatedResponseCopyWithImpl<$Res,
        $Val extends NewsPaginatedResponse>
    implements $NewsPaginatedResponseCopyWith<$Res> {
  _$NewsPaginatedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsPaginatedResponseImplCopyWith<$Res>
    implements $NewsPaginatedResponseCopyWith<$Res> {
  factory _$$NewsPaginatedResponseImplCopyWith(
          _$NewsPaginatedResponseImpl value,
          $Res Function(_$NewsPaginatedResponseImpl) then) =
      __$$NewsPaginatedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, int? totalResults, List<Article>? articles});
}

/// @nodoc
class __$$NewsPaginatedResponseImplCopyWithImpl<$Res>
    extends _$NewsPaginatedResponseCopyWithImpl<$Res,
        _$NewsPaginatedResponseImpl>
    implements _$$NewsPaginatedResponseImplCopyWith<$Res> {
  __$$NewsPaginatedResponseImplCopyWithImpl(_$NewsPaginatedResponseImpl _value,
      $Res Function(_$NewsPaginatedResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_$NewsPaginatedResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsPaginatedResponseImpl implements _NewsPaginatedResponse {
  _$NewsPaginatedResponseImpl(
      {this.status, this.totalResults, final List<Article>? articles})
      : _articles = articles;

  factory _$NewsPaginatedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsPaginatedResponseImplFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  final List<Article>? _articles;
  @override
  List<Article>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NewsPaginatedResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsPaginatedResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsPaginatedResponseImplCopyWith<_$NewsPaginatedResponseImpl>
      get copyWith => __$$NewsPaginatedResponseImplCopyWithImpl<
          _$NewsPaginatedResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsPaginatedResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsPaginatedResponse implements NewsPaginatedResponse {
  factory _NewsPaginatedResponse(
      {final String? status,
      final int? totalResults,
      final List<Article>? articles}) = _$NewsPaginatedResponseImpl;

  factory _NewsPaginatedResponse.fromJson(Map<String, dynamic> json) =
      _$NewsPaginatedResponseImpl.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<Article>? get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsPaginatedResponseImplCopyWith<_$NewsPaginatedResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
