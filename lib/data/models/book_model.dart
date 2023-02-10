import 'dart:ffi';
import 'package:biblioteczka/data/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class Book with _$Book {
  @JsonSerializable(explicitToJson: true)
  const factory Book({
    required String title,
    @Default('') String author,
    @Default('') String pages,
    @Default('') String yearOfEnd,
    @Default(0) int score,
    @Default([]) List<String> notes,
    required BookProgress bookProgress,
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

@JsonSerializable(explicitToJson: true)
class GoogleBookItem {
  final String id;
  final String selfLink;
  final GoogleVolumeInfo volumeInfo;
  final Map<String, String>? searchInfo;

  const GoogleBookItem(
      {required this.id,
      required this.selfLink,
      required this.volumeInfo,
      required this.searchInfo});

  factory GoogleBookItem.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookItemFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookItemToJson(this);
}

@JsonSerializable()
class GoogleVolumeInfo {
  final String title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<Map<String, String>>? industryIdentifiers;
  final int? pageCount;
  final List<String>? categories;
  final double? averageRating;
  final Map<String, String>? imageLinks;

  const GoogleVolumeInfo(
      this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.pageCount,
      this.categories,
      this.averageRating,
      this.imageLinks);

  factory GoogleVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$GoogleVolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleVolumeInfoToJson(this);
}
