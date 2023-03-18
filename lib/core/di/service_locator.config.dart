// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/core/di/modules/network_module.dart' as _i8;
import 'package:news_app/core/network/source/news_client.dart' as _i5;
import 'package:news_app/data/auth_repository.dart' as _i7;
import 'package:news_app/data/news_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
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
    gh.factory<_i3.Dio>(() => networkModule.dio);
    gh.factory<_i4.FirebaseAuth>(() => networkModule.firebaseAuth);
    gh.lazySingleton<_i5.NewsApiClient>(
        () => _i5.NewsApiClient(dio: gh<_i3.Dio>()));
    gh.singleton<_i6.NewsRepository>(
        _i6.NewsRepository(gh<_i5.NewsApiClient>()));
    gh.singleton<_i7.AuthRepository>(
        _i7.AuthRepository(gh<_i4.FirebaseAuth>()));
    return this;
  }
}

class _$NetworkModule extends _i8.NetworkModule {}
