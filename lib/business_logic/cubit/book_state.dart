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
  final List<BookApi> recomendedBooksOfMonth;
  final List<GoogleBookItem> googleBooks;
  final List<Book> chosenList;
  final Book bookForm;
  final Book choosenBook;
  final GoogleBookItem? choosenBookGoogle;
  final String heroTag;
  final BookProgress bookProgress;

  BookState({
    this.status = BookStateStatus.initial,
    this.booksRed = const [],
    this.booksToRead = const [],
    this.booksReading = const [],
    this.recomendedBooks = const [],
    this.recomendedBooksOfMonth = const [],
    this.googleBooks = const [],
    this.chosenList = const [],
    this.bookForm = const Book(
      title: 'This is test book',
      bookProgress: BookProgress.inProgress,
    ),
    this.choosenBook =
        const Book(title: 'title', bookProgress: BookProgress.inProgress),
    this.choosenBookGoogle,
    this.heroTag = '',
    this.bookProgress = BookProgress.inProgress,
  });

// Getter to return list of book red in current year
  List<Book> get redInCurrentYear => booksRed
      .where((element) => element.yearOfEnd == DateTime.now().year.toString())
      .toList();

  // Getter to return length of all lists.
  int get lengthOfAllList =>
      booksReading.length + booksRed.length + booksToRead.length;

  // Methods to conver state class to json and from json
  factory BookState.fromJson(Map<String, dynamic> json) =>
      _$BookStateFromJson(json);
  Map<String, dynamic> toJson() => _$BookStateToJson(this);

  // Method to copy class

  BookState copyWith({
    BookStateStatus? status,
    List<Book>? booksRed,
    List<Book>? booksToRead,
    List<Book>? booksReading,
    List<BookApi>? recomendedBooks,
    List<BookApi>? recomendedBooksOfMonth,
    List<GoogleBookItem>? googleBooks,
    List<Book>? chosenList,
    Book? bookForm,
    Book? choosenBook,
    GoogleBookItem? choosenBookGoogle,
    String? heroTag,
    BookProgress? bookProgress,
  }) {
    return BookState(
      status: status ?? this.status,
      booksRed: booksRed ?? this.booksRed,
      booksToRead: booksToRead ?? this.booksToRead,
      booksReading: booksReading ?? this.booksReading,
      recomendedBooks: recomendedBooks ?? this.recomendedBooks,
      recomendedBooksOfMonth:
          recomendedBooksOfMonth ?? this.recomendedBooksOfMonth,
      googleBooks: googleBooks ?? this.googleBooks,
      chosenList: chosenList ?? this.chosenList,
      bookForm: bookForm ?? this.bookForm,
      choosenBook: choosenBook ?? this.choosenBook,
      choosenBookGoogle: choosenBookGoogle ?? this.choosenBookGoogle,
      heroTag: heroTag ?? this.heroTag,
      bookProgress: bookProgress ?? this.bookProgress,
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
