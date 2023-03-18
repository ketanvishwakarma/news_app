import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
