part of 'bookmark_list_bloc.dart';

class BookmarkListState extends Equatable {
  const BookmarkListState({
    this.articles = const [],
  });

  final List<Article> articles;

  BookmarkListState copyWith({
    List<Article>? articles,
  }) {
    return BookmarkListState(
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [articles];
}
