// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i8;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/core/di/modules/local_module.dart' as _i13;
import 'package:news_app/core/di/modules/network_module.dart' as _i12;
import 'package:news_app/core/network/source/news_client.dart' as _i9;
import 'package:news_app/data/auth_repository.dart' as _i10;
import 'package:news_app/data/bookmark_repository.dart' as _i7;
import 'package:news_app/data/news_repository.dart' as _i11;
import 'package:news_app/models/article_dto/article_dto.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    gh.factory<_i3.FirebaseAuth>(() => networkModule.firebaseAuth);
    gh.factory<_i4.Dio>(() => networkModule.dio);
    gh.lazySingletonAsync<_i5.Box<_i6.ArticleDto>>(() => localModule.todoBox);
    gh.lazySingleton<_i7.BookmarkRepository>(
        () => _i7.BookmarkRepository(gh<_i8.Box<_i6.ArticleDto>>()));
    gh.lazySingleton<_i9.NewsApiClient>(
        () => _i9.NewsApiClient(dio: gh<_i4.Dio>()));
    gh.singleton<_i10.AuthRepository>(
        () => _i10.AuthRepository(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i11.NewsRepository>(
        () => _i11.NewsRepository(gh<_i9.NewsApiClient>()));
    return this;
  }
}

class _$NetworkModule extends _i12.NetworkModule {}

class _$LocalModule extends _i13.LocalModule {}
