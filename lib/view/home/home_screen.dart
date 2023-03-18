import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/article_list/article_list_bloc.dart';
import 'package:news_app/blocs/bookmark_list/bookmark_list_bloc.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/data/bookmark_repository.dart';
import 'package:news_app/data/news_repository.dart';
import 'package:news_app/view/home/widgets/article_list.dart';
import 'package:news_app/view/home/widgets/bookmark_list.dart';
import 'package:news_app/view/home/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ArticleListBloc(newsRepository: getIt.get<NewsRepository>())
                ..add(const ArticleFetchRequested()),
        ),
        BlocProvider(
          create: (context) => BookmarkListBloc(getIt.get<BookmarkRepository>())
            ..add(const BookmarkGetListRequested()),
        ),
      ],
      child: const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(),
          body: TabBarView(
            children: [
              ArticleList(),
              BookmarkList(),
            ],
          ),
        ),
      ),
    );
  }
}
