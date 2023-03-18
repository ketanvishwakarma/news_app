import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/constants/key_constants.dart';
import 'package:news_app/core/di/service_locator.config.dart';
import 'package:news_app/firebase_options.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  uiConfiguration();
  await configureFirebaseApp();
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
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
  ]);
}
