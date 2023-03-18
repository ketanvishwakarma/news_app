// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/blocs/article_list/article_list_bloc.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/data/news_repository.dart';
import 'package:news_app/view/home/widgets/article_card.dart';

class BuildArticles extends StatelessWidget {
  const BuildArticles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleListBloc(newsRepository: getIt.get<NewsRepository>())
            ..add(const ArticleFetchRequested()),
      child: BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.failure:
              return const Center(
                child: Text('Failed to fetch articles'),
              );
            case Status.success:
              if (state.articles.isEmpty) {
                return const Center(child: Text('No articles'));
              }
              return ListView.builder(
                itemCount: state.hasReachedMax
                    ? state.articles.length
                    : state.articles.length + 1,
                itemBuilder: (context, index) {
                  return index >= state.articles.length
                      ? const Center(child: CircularProgressIndicator())
                      : ArticleCard(
                          article: state.articles.elementAt(index),
                        );
                },
              );
            case Status.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
