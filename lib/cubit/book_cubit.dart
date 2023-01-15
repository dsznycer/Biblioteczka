import 'package:biblioteczka/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());
}
