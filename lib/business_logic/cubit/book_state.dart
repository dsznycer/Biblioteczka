// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_cubit.dart';

enum BookStatus { initial, withData, loadingData }

class BookState {
  final BookStatus status;
  final int index;
  final List<Book> books;

  BookState({
    this.status = BookStatus.initial,
    this.index = 0,
    this.books = const [],
  });

  BookState copyWith({
    BookStatus? status,
    int? index,
    List<Book>? books,
  }) {
    return BookState(
      status: status ?? this.status,
      index: index ?? this.index,
      books: books ?? this.books,
    );
  }
}
