import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/news_api_constants.dart';
import 'package:news_app/core/di/service_locator.config.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/models/article_dto/article_dto.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  uiConfiguration();
  await dotenv.load();
  await configureFirebaseApp();
  await configureHive();
  getIt.init();
}

void uiConfiguration() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
}

Future<void> configureFirebaseApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders([
    GoogleProvider(clientId: NewsApiConstants.googleClientId),
  ]);
}

Future<void> configureHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleDtoAdapter());
}
