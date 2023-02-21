import 'dart:ffi';
import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:biblioteczka/data/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../../data/Models/book_model.dart';

part 'book_state.dart';
part 'book_cubit.g.dart';

class BookCubit extends HydratedCubit<BookState> {
  BookCubit({required this.bookRepository}) : super(BookState());

  final BookRepository bookRepository;

  // Add new book to the list of books red
  void addNewBookToRed(Book book) => emit(state.copyWith(
      status: BookStateStatus.withData,
      booksRed: List.of(state.booksRed)..add(book)));

  // Chose new list to show

  void choosenList(List<Book> list) => emit(state.copyWith(chosenList: list));

  void addNewBookToList() {
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

  // Delete list of searched books
  void removeSearchedBooks() => emit(state.copyWith(googleBooks: List.empty()));

  // Methods to delete form book data
  void removeBookFormData() => emit(state.copyWith(
      bookForm: const Book(title: '', bookProgress: BookProgress.red)));

  // Google Books Api methods
  void searchGoogleBooks(String title) async {
    List<GoogleBookItem> listOfGoogleItems = [];

    emit(state.copyWith(status: BookStateStatus.loadingData));
    listOfGoogleItems = await bookRepository.searchGoogleBooks(title);
    emit(state.copyWith(
        status: BookStateStatus.withData, googleBooks: listOfGoogleItems));
  }

  // Hapi Books methods
  void getBestBooksOfYear(String year) async {
    List<BookApi> listOfBookApi = [];

    emit(state.copyWith(status: BookStateStatus.loadingData));
    listOfBookApi = await bookRepository.getBestBooksYear(year);
    emit(state.copyWith(
        status: BookStateStatus.withData, recomendedBooks: listOfBookApi));
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
