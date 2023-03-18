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
      child: const _BuildArticlesList(),
    );
  }
}

class _BuildArticlesList extends StatefulWidget {
  const _BuildArticlesList();

  @override
  State<_BuildArticlesList> createState() => _BuildArticlesListState();
}

class _BuildArticlesListState extends State<_BuildArticlesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleListBloc, ArticleListState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const Center(child: CircularProgressIndicator());
          case Status.failure:
            return const Center(
              child: Text('Failed to fetch articles'),
            );
          case Status.inProgress:
          case Status.success:
            if (state.articles.isEmpty) {
              return const Center(child: Text('No articles'));
            }
            return ListView.builder(
              controller: _scrollController,
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
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ArticleListBloc>().add(const ArticleFetchRequested());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
