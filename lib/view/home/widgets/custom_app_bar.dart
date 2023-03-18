import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/auth/auth_bloc.dart';
import 'package:news_app/core/styles/app_sizes.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.largeSpace),
          child: Row(
            children: [
              const UserGreetingWidget(),
              const Spacer(),
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
        ),
        const TabBar(
          tabs: [
            Tab(
              text: 'Home',
            ),
            Tab(
              text: 'Bookmarked',
            ),
          ],
        )
      ],
    );
  }
}

class UserGreetingWidget extends StatelessWidget {
  const UserGreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: textTheme.titleMedium,
        ),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return Text(
                state.user.displayName ?? '',
                style: textTheme.titleLarge,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
