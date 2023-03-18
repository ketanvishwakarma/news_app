import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/bookmark_list/bookmark_list_bloc.dart';
import 'package:news_app/view/home/widgets/article_card.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkListBloc, BookmarkListState>(
      builder: (context, state) {
        if (state.articles.isEmpty) {
          return const Center(child: Text('No bookmarked articles!'));
        }
        return ListView.builder(
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            return ArticleCard(
              article: state.articles.elementAt(index),
            );
          },
        );
      },
    );
  }
}
