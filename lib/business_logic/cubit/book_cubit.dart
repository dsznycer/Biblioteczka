import 'package:biblioteczka/data/Repositories/book_repository.dart';
import 'package:biblioteczka/data/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_state.dart';
part 'book_cubit.g.dart';

class BookCubit extends HydratedCubit<BookState> {
  BookCubit(this._bookRepository) : super(BookState());

  final BookRepository _bookRepository;

  void addNewBook(Book book) => emit(state.copyWith(
      status: BookStatus.withData,
      booksRed: List.of(state.booksRed)..add(book)));

  void toInitial() => emit(BookState(status: BookStatus.initial));

  void removeLast() =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeLast()));

  void removeBookAtIndex(index) =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeAt(index)));

  void getBestBooksOfYear(String year) async {
    List<BookApi> listOfBookApi = [];

    emit(state.copyWith(status: BookStatus.loadingData));

    listOfBookApi = await _bookRepository.getBestBooksYear('2022');

    emit(state.copyWith(
        status: BookStatus.withData, recomendedBooks: listOfBookApi));
  }

  // Methods to write and read state from json
  @override
  BookState? fromJson(Map<String, dynamic> json) {
    return _$BookStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BookState state) {
    return _$BookStateToJson(state);
  }
}
