part of 'search_news_bloc.dart';

abstract class SearchNewsEvent extends Equatable {
  const SearchNewsEvent();

  @override
  List<Object> get props => [];
}

class ResetState extends SearchNewsEvent {}

class SearchNewsRequested extends SearchNewsEvent {
  const SearchNewsRequested(
    this.query,
  );

  final String query;

  @override
  List<Object> get props => [query];
}
