part of 'article_list_bloc.dart';

abstract class ArticleListEvent extends Equatable {
  const ArticleListEvent();

  @override
  List<Object> get props => [];
}

class ArticleFetchRequested extends ArticleListEvent {
  const ArticleFetchRequested();
}
