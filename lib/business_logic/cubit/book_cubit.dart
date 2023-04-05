import 'dart:ffi';
import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../../data/Models/BookModels/book_model.dart';

part 'book_state.dart';
part 'book_cubit.g.dart';

class BookCubit extends HydratedCubit<BookState> {
  BookCubit({required this.bookRepository}) : super(BookState()) {
    if (state.recomendedBooks.isEmpty) {
      getBestBooksOfYear((DateTime.now().year - 1).toString());
    }
    if (state.recomendedBooksOfMonth.isEmpty) {
      getBestBookOfMonth();
    }
  }

  final BookRepository bookRepository;

  // Add new book to the list of redd books
  void addNewBookToRed(Book book) => emit(state.copyWith(
      status: BookStateStatus.withData,
      booksRed: List.of(state.booksRed)..add(book)));

  // Chose new list to show
  void choosenList(List<Book> list) => emit(state.copyWith(chosenList: list));

  void addNewBookToListFromForm() {
    switch (state.bookForm.bookProgress) {
      case BookProgress.red:
        {
          emit(state.copyWith(
              booksRed: List.of(state.booksRed)..add(state.bookForm)));
        }
        break;
      case BookProgress.inProgress:
        {
          emit(state.copyWith(
              booksReading: List.of(state.booksReading)..add(state.bookForm)));
        }
        break;
      case BookProgress.toRead:
        {
          emit(state.copyWith(
              booksToRead: List.of(state.booksToRead)..add(state.bookForm)));
        }
        break;
    }
  }

  void addNewBookFromObject(Book book) {
    switch (book.bookProgress) {
      case BookProgress.red:
        emit(state.copyWith(booksRed: List.of(state.booksRed)..add(book)));
        break;
      case BookProgress.inProgress:
        emit(state.copyWith(
            booksReading: List.of(state.booksReading)..add(book)));
        break;
      case BookProgress.toRead:
        emit(
            state.copyWith(booksToRead: List.of(state.booksToRead)..add(book)));
        break;
    }
  }

  // Remove book depend of book progress
  void removeBookFromList(Book book) {
    switch (book.bookProgress) {
      case BookProgress.red:
        {
          emit(state.copyWith(booksRed: List.of(state.booksRed)..remove(book)));
        }
        break;
      case BookProgress.inProgress:
        {
          emit(state.copyWith(
              booksReading: List.of(state.booksReading)..remove(book)));
        }
        break;
      case BookProgress.toRead:
        {
          emit(state.copyWith(
              booksToRead: List.of(state.booksToRead)..remove(book)));
        }
        break;
    }
  }

  // Change choosen Book
  void changeChoosenBook(Book book, String heroTag) => emit(state.copyWith(
      choosenBook: book, heroTag: heroTag, bookProgress: book.bookProgress));

  // Create Book to read from Goole Book Item
  void createBookFromGoogleBook() {
    final googleBook = state.choosenBookGoogle!.volumeInfo;
    final bookToRead = Book(
        title: googleBook.title,
        author: googleBook.authors.first ?? 'empty',
        description: googleBook.description,
        pages: googleBook.pageCount.toString(),
        urlPhoto: googleBook.imageLinks.values.first,
        bookProgress: BookProgress.toRead);

    addNewBookFromObject(bookToRead);
  }

  // Create book to read form Hapi Api recomended books
  void creatBookFromHapiApiBook() {
    final choosenApiBook = state.choosenBookApi!;
    final newBookItem = Book(
      title: choosenApiBook.name,
      author: choosenApiBook.authors.first,
      description: choosenApiBook.synopsis,
      pages: choosenApiBook.pages.toString(),
      score: choosenApiBook.rating,
      urlPhoto: choosenApiBook.cover,
      bookProgress: BookProgress.toRead,
    );

    addNewBookFromObject(newBookItem);
  }

  // Change choosen Google Book
  void changeBookGoogle(GoogleBookItem book) =>
      emit(state.copyWith(choosenBookGoogle: book));

  // Change book progress
  void changeBookProgress(BookProgress value) =>
      emit(state.copyWith(bookProgress: value));

  // Migrate book from one list to another depend of choosen value by user
  void checkAndChange() {
    // Check if Book Progress have changed
    if (state.bookProgress != state.choosenBook.bookProgress) {
      // remove book from list
      removeBookFromList(state.choosenBook);
      // Change choosenBook
      changeChoosenBook(
          state.choosenBook.copyWith(bookProgress: state.bookProgress),
          state.heroTag);
      // add book to list
      addNewBookFromObject(state.choosenBook);
      // Set acutual value of choosenBook
    }
  }

  // Updating value of form book
  void updateFormTitle(String title) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(title: title)));

  void updateFormAuthor(String author) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(author: author)));

  void updateFormYearOfEnd(String year) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(yearOfEnd: year)));

  void updateFormPages(String pages) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(pages: pages)));

  void updateFormScore(double score) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(score: score)));

  void updateFormPhoto(String photo) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(urlPhoto: photo)));

  void updateBookFormProgress(BookProgress pro) => emit(
      state.copyWith(bookForm: state.bookForm.copyWith(bookProgress: pro)));

  // Remove last book from booksRed
  void removeLastBooksRed() =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeLast()));

  void removeLastBooksToRed() => emit(
      state.copyWith(booksToRead: List.of(state.booksToRead)..removeLast()));

  void removeLastBookReading() => emit(state.copyWith(
      booksReading: List.from(state.booksReading)..removeLast()));

  // Delete list of searched google books
  void removeSearchedBooks() => emit(state.copyWith(googleBooks: List.empty()));

  // Methods to delete form book data
  void removeBookFormData() => emit(state.copyWith(
      bookForm: const Book(title: '', bookProgress: BookProgress.red)));

  // *** API METHODS ***

  // Google Books Api methods
  void searchGoogleBooks(String title) async {
    List<GoogleBookItem> listOfGoogleItems = [];

    emit(state.copyWith(status: BookStateStatus.loadingData));
    listOfGoogleItems = await bookRepository.searchGoogleBooks(title);
    emit(state.copyWith(
        status: BookStateStatus.withData, googleBooks: listOfGoogleItems));
  }

  // Hapi Books methods

  // Get best book of year
  void getBestBooksOfYear(String year) async {
    List<BookApi> listOfBookApi = [];

    emit(state.copyWith(status: BookStateStatus.loadingData));
    listOfBookApi = await bookRepository.getBestBooksYear(year);
    emit(state.copyWith(
        status: BookStateStatus.withData, recomendedBooks: listOfBookApi));
  }

  //Get best book of month
  void getBestBookOfMonth() async {
    List<BookApi> listOfBookApi = [];
    emit(state.copyWith(status: BookStateStatus.loadingData));
    listOfBookApi = await bookRepository.getBooksByMonth();
    emit(state.copyWith(
        status: BookStateStatus.withData,
        recomendedBooksOfMonth: listOfBookApi));
  }

  // Get book from Hapi Api by Book Id
  void getHapiApiBookID(String id) async {
    emit(state.copyWith(status: BookStateStatus.loadingData));
    BookApiModel bookApi = await bookRepository.getBookApiBookByID(id);
    emit(state.copyWith(
        choosenBookApi: bookApi, status: BookStateStatus.withData));
  }

  // Methods to write and read state from json
  @override
  BookState? fromJson(Map<String, dynamic> json) {
    return BookState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BookState state) {
    return state.toJson();
  }
}
