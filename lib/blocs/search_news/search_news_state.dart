part of 'search_news_bloc.dart';

class SearchNewsState extends Equatable {
  const SearchNewsState({
    this.status = Status.initial,
    this.articles = const [],
  });

  final Status status;
  final List<Article> articles;

  SearchNewsState copyWith({
    Status? status,
    List<Article>? articles,
  }) {
    return SearchNewsState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object> get props => [status, articles];
}
