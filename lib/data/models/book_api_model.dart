import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_api_model.freezed.dart';
part 'book_api_model.g.dart';

@freezed
class BookApi with _$BookApi {
  const factory BookApi(int timestamp,
      {required String title, required String author}) = _BookApi;

  factory BookApi.fromJson(Map<String, dynamic> json) =>
      _$BookApiFromJson(json);
}
