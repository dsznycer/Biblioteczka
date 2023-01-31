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
    );

Map<String, dynamic> _$BookStateToJson(BookState instance) => <String, dynamic>{
      'status': _$BookStatusEnumMap[instance.status]!,
      'booksRed': instance.booksRed,
      'booksToRead': instance.booksToRead,
    };

const _$BookStatusEnumMap = {
  BookStatus.initial: 'initial',
  BookStatus.withData: 'withData',
  BookStatus.loadingData: 'loadingData',
};
