import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String title,
    required String author,
    required String pages,
    required String yearOfEnd,
    @Default(0) int score,
    required List<String> notes,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

@freezed
class BookApi with _$BookApi {
  const factory BookApi({
    required String book_Id,
    required String name,
    required String category,
    required String cover,
  }) = _BookApi;

  factory BookApi.fromJson(Map<String, dynamic> json) =>
      _$BookApiFromJson(json);
}
