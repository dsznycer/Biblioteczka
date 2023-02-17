// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'book_cubit.dart';

enum BookStateStatus { initial, withData, loadingData }

@JsonSerializable(explicitToJson: true)
class BookState {
  final BookStateStatus status;
  final List<Book> booksRed;
  final List<Book> booksToRead;
  final List<Book> booksReading;
  final List<BookApi> recomendedBooks;
  final List<GoogleBookItem> googleBooks;
  final List<List<Book>> chosenList;
  final Book bookForm;

  BookState({
    this.status = BookStateStatus.initial,
    this.booksRed = const [],
    this.booksToRead = const [],
    this.booksReading = const [],
    this.recomendedBooks = const [],
    this.googleBooks = const [],
    this.chosenList = const [],
    this.bookForm = const Book(
        title: 'This is test book',
        author: 'test',
        yearOfEnd: '2023',
        pages: '23',
        notes: ['notes'],
        bookProgress: BookProgress.inProgress,
        score: 2),
  });

  factory BookState.fromJson(Map<String, dynamic> json) =>
      _$BookStateFromJson(json);

  Map<String, dynamic> toJson() => _$BookStateToJson(this);

  BookState copyWith({
    BookStateStatus? status,
    List<Book>? booksRed,
    List<Book>? booksToRead,
    List<Book>? booksReading,
    List<BookApi>? recomendedBooks,
    List<GoogleBookItem>? googleBooks,
    Book? bookForm,
  }) {
    return BookState(
      status: status ?? this.status,
      booksRed: booksRed ?? this.booksRed,
      booksToRead: booksToRead ?? this.booksToRead,
      booksReading: booksReading ?? this.booksReading,
      recomendedBooks: recomendedBooks ?? this.recomendedBooks,
      googleBooks: googleBooks ?? this.googleBooks,
      bookForm: bookForm ?? this.bookForm,
    );
  }
}


//Version of state with freezed anotation

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
