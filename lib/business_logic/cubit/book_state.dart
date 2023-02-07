// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'book_cubit.dart';

enum BookStatus { initial, withData, loadingData }

@JsonSerializable(explicitToJson: true)
class BookState {
  final BookStatus status;
  final List<Book> booksRed;
  final List<Book> booksToRead;
  final List<Book> booksReading;
  final List<BookApi> recomendedBooks;
  final List<GoogleBookItem> googleBooks;

  BookState({
    this.status = BookStatus.initial,
    this.booksRed = const [],
    this.booksToRead = const [],
    this.booksReading = const [],
    this.recomendedBooks = const [],
    this.googleBooks = const [],
  });

  factory BookState.fromJson(Map<String, dynamic> json) =>
      _$BookStateFromJson(json);

  Map<String, dynamic> toJson() => _$BookStateToJson(this);

  BookState copyWith({
    BookStatus? status,
    List<Book>? booksRed,
    List<Book>? booksToRead,
    List<Book>? booksReading,
    List<BookApi>? recomendedBooks,
    List<GoogleBookItem>? googleBooks,
  }) {
    return BookState(
      status: status ?? this.status,
      booksRed: booksRed ?? this.booksRed,
      booksToRead: booksToRead ?? this.booksToRead,
      booksReading: booksReading ?? this.booksReading,
      recomendedBooks: recomendedBooks ?? this.recomendedBooks,
      googleBooks: googleBooks ?? this.googleBooks,
    );
  }
}


// @freezed
// @JsonSerializable(explicitToJson: true)
// class BookState with _$BookState {
//   factory BookState({
//     @Default(BookStatus.initial) BookStatus status,
//     @Default(<Book>[]) List<Book> booksRed,
//     @Default(<Book>[]) List<Book> booksToRead,
//     @Default(<Book>[]) List<Book> booksReading,
//     @Default(<BookApi>[]) List<BookApi> recomendedBooks,
//   }) = _BookState;

//   factory BookState.fromJson(Map<String, dynamic> json) =>
//       _$BookStateFromJson(json);
// }
