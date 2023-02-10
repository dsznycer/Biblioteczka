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

  void addNewBookFromForm() {
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

  // Updating value of form book
  void updateFormTitle(String title) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(title: title)));

  void updateFormAuthor(String author) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(author: author)));

  void updateFormYearOfEnd(String year) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(yearOfEnd: year)));

  void updateFormPages(String pages) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(pages: pages)));

  void updateFormScore(int score) =>
      emit(state.copyWith(bookForm: state.bookForm.copyWith(score: score)));

  // Remove last book from booksRed
  void removeLastBooksRed() =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeLast()));

  void removeLastBooksToRed() => emit(
      state.copyWith(booksToRead: List.of(state.booksToRead)..removeLast()));

  void removeLastBookReading() => emit(state.copyWith(
      booksReading: List.from(state.booksReading)..removeLast()));

  // Remove book from
  void removeRedBookAtIndex(index) =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeAt(index)));

  // Delete list of searched books
  void removeSearchedBooks() => emit(state.copyWith(googleBooks: List.empty()));

  // Methods to manipulate bookForm
  void updateBookFormProgress(BookProgress pro) => emit(
      state.copyWith(bookForm: state.bookForm.copyWith(bookProgress: pro)));

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
