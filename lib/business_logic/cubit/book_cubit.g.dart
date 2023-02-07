// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookState _$BookStateFromJson(Map<String, dynamic> json) => BookState(
      status: $enumDecodeNullable(_$BookStatusEnumMap, json['status']) ??
          BookStatus.initial,
      booksRed: (json['booksRed'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      booksToRead: (json['booksToRead'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      booksReading: (json['booksReading'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recomendedBooks: (json['recomendedBooks'] as List<dynamic>?)
              ?.map((e) => BookApi.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      googleBooks: (json['googleBooks'] as List<dynamic>?)
              ?.map((e) => GoogleBookItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BookStateToJson(BookState instance) => <String, dynamic>{
      'status': _$BookStatusEnumMap[instance.status]!,
      'booksRed': instance.booksRed.map((e) => e.toJson()).toList(),
      'booksToRead': instance.booksToRead.map((e) => e.toJson()).toList(),
      'booksReading': instance.booksReading.map((e) => e.toJson()).toList(),
      'recomendedBooks':
          instance.recomendedBooks.map((e) => e.toJson()).toList(),
      'googleBooks': instance.googleBooks.map((e) => e.toJson()).toList(),
    };

const _$BookStatusEnumMap = {
  BookStatus.initial: 'initial',
  BookStatus.withData: 'withData',
  BookStatus.loadingData: 'loadingData',
};
