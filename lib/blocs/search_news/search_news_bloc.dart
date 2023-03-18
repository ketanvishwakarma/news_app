import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/enums/status.dart';
import 'package:news_app/data/news_repository.dart';
import 'package:news_app/models/article/article.dart';

part 'search_news_event.dart';
part 'search_news_state.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  SearchNewsBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const SearchNewsState()) {
    on<SearchNewsRequested>(_onSearchNewsRequested);
    on<ResetState>(_onResetState);
  }

  final NewsRepository _newsRepository;

  FutureOr<void> _onSearchNewsRequested(
    SearchNewsRequested event,
    Emitter<SearchNewsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: Status.inProgress,
        ),
      );
      final response = await _newsRepository.searchNews(event.query);
      if (response.status == 'ok') {
        emit(
          state.copyWith(
            status: Status.success,
            articles: List.of(state.articles)..addAll(response.articles ?? []),
          ),
        );
      } else {
        throw Exception('Something went wrong');
      }
    } on Exception {
      emit(
        state.copyWith(
          status: Status.failure,
        ),
      );
    }
  }

  FutureOr<void> _onResetState(
    ResetState event,
    Emitter<SearchNewsState> emit,
  ) {
    emit(const SearchNewsState());
  }
}
