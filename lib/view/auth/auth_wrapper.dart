import 'package:firebase_ui_auth/firebase_ui_auth.dart' show SignInScreen;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/auth/auth_bloc.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/data/auth_repository.dart';
import 'package:news_app/view/home/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: getIt.get<AuthRepository>()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomeScreen();
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
