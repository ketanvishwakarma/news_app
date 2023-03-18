part of 'article_list_bloc.dart';

enum Status { initial, success, failure }

class ArticleListState extends Equatable {
  const ArticleListState({
    this.status = Status.initial,
    this.articles = const [],
    this.hasReachedMax = false,
  });

  final Status status;
  final List<Article> articles;
  final bool hasReachedMax;

  ArticleListState copyWith({
    Status? status,
    List<Article>? articles,
    bool? hasReachedMax,
  }) {
    return ArticleListState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, articles, hasReachedMax];
}
