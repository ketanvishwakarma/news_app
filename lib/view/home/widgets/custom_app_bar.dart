import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/auth/auth_bloc.dart';
import 'package:news_app/blocs/search_news/search_news_bloc.dart';
import 'package:news_app/core/enums/status.dart';
import 'package:news_app/core/styles/app_sizes.dart';
import 'package:news_app/view/home/widgets/article_card.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.large),
          child: Row(
            children: [
              const UserGreetingWidget(),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showSearch<String>(
                    context: context,
                    delegate:
                        CustomSearchDelegate(context.read<SearchNewsBloc>()),
                  );
                },
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
        ),
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

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate(this.searchBloc);

  final SearchNewsBloc searchBloc;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isNotEmpty) {
      searchBloc.add(SearchNewsRequested(query.trim()));
    }
    return BlocBuilder<SearchNewsBloc, SearchNewsState>(
      bloc: searchBloc,
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
          case Status.inProgress:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.success:
            if (state.articles.isEmpty) {
              return const Center(child: Text('No Result found'));
            }
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ArticleCard(
                  article: state.articles.elementAt(index),
                  showBookmark: false,
                );
              },
            );
          case Status.failure:
            return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ? Since we have limited Api call on free plan!
    // ? To reduce the API call this features is not implemented
    return const SizedBox.shrink();
  }
}
