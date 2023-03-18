import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/bookmark_repository.dart';
import 'package:news_app/models/article/article.dart';

part 'bookmark_list_event.dart';
part 'bookmark_list_state.dart';

class BookmarkListBloc extends Bloc<BookmarkListEvent, BookmarkListState> {
  BookmarkListBloc(this._bookmarkRepository)
      : super(const BookmarkListState()) {
    on<BookmarkGetListRequested>(_onBookmarkGetListRequested);
    on<BookmarkToggleRequested>(_onBookmarkToggleRequested);
  }

  final BookmarkRepository _bookmarkRepository;

  FutureOr<void> _onBookmarkGetListRequested(
    BookmarkGetListRequested event,
    Emitter<BookmarkListState> emit,
  ) {
    final list = _bookmarkRepository.getArticleDtoList();
    emit(state.copyWith(articles: list.map(Article.fromArticleDto).toList()));
  }

  FutureOr<void> _onBookmarkToggleRequested(
    BookmarkToggleRequested event,
    Emitter<BookmarkListState> emit,
  ) {
    final articleDto = event.article.toArticleDto();
    final list = [...state.articles];
    if (_bookmarkRepository.isStored(articleDto)) {
      _bookmarkRepository.remove(articleDto);
      list.remove(event.article);
    } else {
      _bookmarkRepository.add(articleDto);
      list.add(event.article);
    }
    emit(
      state.copyWith(
        articles: list,
      ),
    );
  }

}
