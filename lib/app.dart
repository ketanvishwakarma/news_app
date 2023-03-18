import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/styles/app_theme.dart';
import 'package:news_app/view/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
