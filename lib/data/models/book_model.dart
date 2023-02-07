import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class Book with _$Book {
  @JsonSerializable(explicitToJson: true)
  const factory Book({
    required String title,
    required String author,
    required String pages,
    required String yearOfEnd,
    @Default(0) int score,
    List<String>? notes,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

@freezed
class BookApi with _$BookApi {
  @JsonSerializable(explicitToJson: true)
  const factory BookApi({
    required String book_id,
    required String name,
    required String category,
    required String cover,
  }) = _BookApi;

  factory BookApi.fromJson(Map<String, dynamic> json) =>
      _$BookApiFromJson(json);
}

@JsonSerializable()
class GoogleBookItem {
  final String googleId;
  final String etag;
  final String selfLink;

  const GoogleBookItem({
    required this.googleId,
    required this.etag,
    required this.selfLink,
  });

  factory GoogleBookItem.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookItemFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookItemToJson(this);
}
