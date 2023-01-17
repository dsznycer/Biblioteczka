import 'package:biblioteczka/data/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());

  void addNewBook(Book book) => emit(state.copyWith(
      status: BookStatus.withData, books: List.of(state.books)..add(book)));

  void toInitial() => emit(BookState(status: BookStatus.initial));

  void addIndex(value) => emit(state.copyWith(index: value));
}
