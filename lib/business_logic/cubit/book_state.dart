// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'book_cubit.dart';

enum BookStatus { initial, withData, loadingData }

@JsonSerializable()
class BookState {
  final BookStatus status;
  final List<Book> booksRed;
  final List<Book> booksToRead;
  final List<BookApi> recomendedBooks;

  BookState({
    this.status = BookStatus.initial,
    this.booksRed = const [],
    this.booksToRead = const [],
    this.recomendedBooks = const [],
  });

  BookState copyWith({
    BookStatus? status,
    List<Book>? booksRed,
    List<Book>? booksToRead,
    List<BookApi>? recomendedBooks,
  }) {
    return BookState(
      status: status ?? this.status,
      booksRed: booksRed ?? this.booksRed,
      booksToRead: booksToRead ?? this.booksToRead,
      recomendedBooks: recomendedBooks ?? this.recomendedBooks,
    );
  }
}
