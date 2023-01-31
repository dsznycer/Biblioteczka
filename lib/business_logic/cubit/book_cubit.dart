import 'package:biblioteczka/data/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_state.dart';
part 'book_cubit.g.dart';

class BookCubit extends HydratedCubit<BookState> {
  BookCubit() : super(BookState());

  void addNewBook(Book book) => emit(state.copyWith(
      status: BookStatus.withData,
      booksRed: List.of(state.booksRed)..add(book)));

  void toInitial() => emit(BookState(status: BookStatus.initial));

  void removeLast() =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeLast()));

  void removeBookAtIndex(index) =>
      emit(state.copyWith(booksRed: List.of(state.booksRed)..removeAt(index)));

  @override
  BookState? fromJson(Map<String, dynamic> json) {
    return _$BookStateFromJson(json);
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(BookState state) {
    return _$BookStateToJson(state);
    throw UnimplementedError();
  }
}
