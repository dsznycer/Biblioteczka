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
    @Default(0) double score,
    @Default('brak') String description,
    @Default(Utils.basicBookPhoto) String urlPhoto,
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
    @Default('') String category,
    required String cover,
    @Default(0) double rating,
    @Default('') String description,
  }) = _BookApi;

  factory BookApi.fromJson(Map<String, dynamic> json) =>
      _$BookApiFromJson(json);
}

@freezed
class BookApiModel with _$BookApiModel {
  @JsonSerializable(explicitToJson: true)
  const factory BookApiModel({
    required int book_id,
    required String name,
    @Default(Utils.basicBookPhoto) String cover,
    @Default(['brak']) List<String> authors,
    @Default(0) double rating,
    @Default(0) int pages,
    @Default('brak') String published_date,
    @Default('brak') String synopsis,
  }) = _BookApiModel;

  factory BookApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookApiModelFromJson(json);
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

@freezed
class GoogleVolumeInfo with _$GoogleVolumeInfo {
  const factory GoogleVolumeInfo({
    required String title,
    @Default(['brak'])
        List<String> authors,
    @Default('')
        String publisher,
    @Default('')
        String publishedDate,
    @Default('Brak opisu :(')
        String description,
    @Default([
      {'brak': 'brak'}
    ])
        List<Map<String, String>> industryIdentifiers,
    @Default(0)
        int pageCount,
    @Default(['brak'])
        List<String> categories,
    @Default(0)
        double averageRating,
    @Default(Utils.basicBookGoogle)
        Map<String, String> imageLinks,
  }) = _GoogleVolumeInfo;

  factory GoogleVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$GoogleVolumeInfoFromJson(json);
}
