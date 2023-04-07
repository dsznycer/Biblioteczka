import 'package:biblioteczka/data/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'challenges_model.freezed.dart';
part 'challenges_model.g.dart';

@freezed
class ChallengeItem with _$ChallengeItem {
  const factory ChallengeItem({
    required String name,
    @Default('') String description,
    required DateTime dateOfStart,
    required int monthsToFinish,
    required int booksToRead,
    @Default(0) int booksread,
  }) = _ChallengeItem;

  factory ChallengeItem.fromJson(Map<String, dynamic> json) =>
      _$ChallengeItemFromJson(json);
}

@freezed
class PagesRedInDay with _$PagesRedInDay {
  const factory PagesRedInDay({
    required DateTime dateTime,
    required int pages,
  }) = _PagesRedInDay;

  factory PagesRedInDay.fromJson(Map<String, dynamic> json) =>
      _$PagesRedInDayFromJson(json);
}
