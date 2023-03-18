part of 'bookmark_list_bloc.dart';

abstract class BookmarkListEvent extends Equatable {
  const BookmarkListEvent();

  @override
  List<Object> get props => [];
}

class BookmarkGetListRequested extends BookmarkListEvent {
  const BookmarkGetListRequested();
}

class BookmarkToggleRequested extends BookmarkListEvent {
  const BookmarkToggleRequested(
    this.article,
  );

  final Article article;

  @override
  List<Object> get props => [article];
}
