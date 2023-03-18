import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/auth/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state as Authenticated;
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return Text(
                'Welcome ${authState.user.displayName?.split(' ').first ?? ''}',
              );
            }
            return const Text(
              'Welcome',
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogOutRequested());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home screen'),
      ),
    );
  }
}
