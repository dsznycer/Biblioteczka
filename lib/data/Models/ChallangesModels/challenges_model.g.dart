// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChallengeItem _$$_ChallengeItemFromJson(Map<String, dynamic> json) =>
    _$_ChallengeItem(
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      dateOfStart: DateTime.parse(json['dateOfStart'] as String),
      monthsToFinish: json['monthsToFinish'] as int,
      booksToRead: json['booksToRead'] as int,
      booksread: json['booksread'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ChallengeItemToJson(_$_ChallengeItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'dateOfStart': instance.dateOfStart.toIso8601String(),
      'monthsToFinish': instance.monthsToFinish,
      'booksToRead': instance.booksToRead,
      'booksread': instance.booksread,
    };

_$_PagesRedInDay _$$_PagesRedInDayFromJson(Map<String, dynamic> json) =>
    _$_PagesRedInDay(
      dateTime: DateTime.parse(json['dateTime'] as String),
      pages: json['pages'] as int,
    );

Map<String, dynamic> _$$_PagesRedInDayToJson(_$_PagesRedInDay instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'pages': instance.pages,
    };
