import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/news_repository.dart';
import 'package:news_app/models/article/article.dart';

part 'article_list_event.dart';
part 'article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  ArticleListBloc({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const ArticleListState()) {
    on<ArticleFetchRequested>(_onArticleFetchRequested);
  }

  final NewsRepository _newsRepository;
  var _page = 1;

  FutureOr<void> _onArticleFetchRequested(
    ArticleFetchRequested event,
    Emitter<ArticleListState> emit,
  ) async {
    if (state.hasReachedMax || state.status == Status.inProgress) return;
    try {
      emit(
        state.copyWith(
          status: Status.inProgress,
        ),
      );
      final response = await _newsRepository.getTopHeadlines(_page);
      if (response.status == 'ok') {
        emit(
          state.copyWith(
            status: Status.success,
            articles: List.of(state.articles)..addAll(response.articles ?? []),
          ),
        );
        if (state.articles.length == response.totalResults ||
            (response.articles?.isEmpty ?? true)) {
          emit(
            state.copyWith(
              hasReachedMax: true,
            ),
          );
        } else {
          _page++;
        }
      }
    } on Exception {
      emit(
        state.copyWith(
          status: Status.failure,
        ),
      );
    }
  }
}
