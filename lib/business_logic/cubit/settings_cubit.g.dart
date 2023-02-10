// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    SettingsState(
      index: json['index'] as int? ?? 0,
      darkMode: json['darkMode'] as bool? ?? false,
      chosenBook: json['chosenBook'] == null
          ? const Book(
              title: 'This is test book',
              author: 'test',
              yearOfEnd: '2023',
              pages: '23',
              notes: ['notes'],
              bookProgress: BookProgress.inProgress,
              score: 2)
          : Book.fromJson(json['chosenBook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsStateToJson(SettingsState instance) =>
    <String, dynamic>{
      'index': instance.index,
      'darkMode': instance.darkMode,
      'chosenBook': instance.chosenBook,
    };
