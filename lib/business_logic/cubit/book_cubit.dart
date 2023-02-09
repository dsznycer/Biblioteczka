import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

import '../../data/Models/book_model.dart';

part 'book_state.dart';
part 'book_cubit.g.dart';

class BookCubit extends HydratedCubit<BookState> {
  BookCubit(this._bookRepository) : super(BookState());

  final BookRepository _bookRepository;

  // Add new book to the list of books red
  void addNewBook(Book book) => emit(state.copyWith(
      status: BookStatus.withData,
      booksRed: List.of(state.booksRed)..add(book)));

  // Remove last book from booksRed
  void removeLast() =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeLast()));

  // Remove book from
  void removeRedBookAtIndex(index) =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeAt(index)));

  // Delete list of searched books
  void removeSearchedBooks() => emit(state.copyWith(googleBooks: List.empty()));

  // Google Books Api methods
  void searchGoogleBooks(String title) async {
    List<GoogleBookItem> listOfGoogleItems = [];

    emit(state.copyWith(status: BookStatus.loadingData));
    listOfGoogleItems = await _bookRepository.searchGoogleBooks(title);
    emit(state.copyWith(
        status: BookStatus.withData, googleBooks: listOfGoogleItems));
  }

  // Hapi Books methods
  void getBestBooksOfYear(String year) async {
    List<BookApi> listOfBookApi = [];

    emit(state.copyWith(status: BookStatus.loadingData));
    listOfBookApi = await _bookRepository.getBestBooksYear(year);
    emit(state.copyWith(
        status: BookStatus.withData, recomendedBooks: listOfBookApi));
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
