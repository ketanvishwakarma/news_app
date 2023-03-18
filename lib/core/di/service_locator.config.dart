// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i11;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/core/di/modules/local_module.dart' as _i13;
import 'package:news_app/core/di/modules/network_module.dart' as _i12;
import 'package:news_app/core/network/source/news_client.dart' as _i7;
import 'package:news_app/data/auth_repository.dart' as _i9;
import 'package:news_app/data/bookmark_repository.dart' as _i10;
import 'package:news_app/data/news_repository.dart' as _i8;
import 'package:news_app/models/article_dto/article_dto.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final networkModule = _$NetworkModule();
    await gh.lazySingletonAsync<_i3.Box<_i4.ArticleDto>>(
      () => localModule.todoBox,
      preResolve: true,
    );
    gh.factory<_i5.Dio>(() => networkModule.dio);
    gh.factory<_i6.FirebaseAuth>(() => networkModule.firebaseAuth);
    gh.lazySingleton<_i7.NewsApiClient>(
        () => _i7.NewsApiClient(dio: gh<_i5.Dio>()));
    gh.lazySingleton<_i8.NewsRepository>(
        () => _i8.NewsRepository(gh<_i7.NewsApiClient>()));
    gh.singleton<_i9.AuthRepository>(
        _i9.AuthRepository(gh<_i6.FirebaseAuth>()));
    gh.lazySingleton<_i10.BookmarkRepository>(
        () => _i10.BookmarkRepository(gh<_i11.Box<_i4.ArticleDto>>()));
    return this;
  }
}

class _$NetworkModule extends _i12.NetworkModule {}

class _$LocalModule extends _i13.LocalModule {}
