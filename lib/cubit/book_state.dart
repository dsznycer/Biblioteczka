part of 'book_cubit.dart';

enum BookStatus { initial, withData, failure }

class BookState {
  final BookStatus status;
  final int index;
  final List<Book> books;

  BookState({
    this.status = BookStatus.initial,
    this.index = 0,
    this.books = const [],
  });
}
