import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_theme.dart';
import 'package:news_app/view/auth/auth_wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: AppTheme.darkTheme,
      home: const AuthWrapper(),
    );
  }
}
