// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookState _$BookStateFromJson(Map<String, dynamic> json) => BookState(
      status: $enumDecodeNullable(_$BookStateStatusEnumMap, json['status']) ??
          BookStateStatus.initial,
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
      chosenList: (json['chosenList'] as List<dynamic>?)
              ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bookForm: json['bookForm'] == null
          ? const Book(
              title: 'This is test book', bookProgress: BookProgress.inProgress)
          : Book.fromJson(json['bookForm'] as Map<String, dynamic>),
      choosenBook: json['choosenBook'] == null
          ? const Book(title: 'title', bookProgress: BookProgress.inProgress)
          : Book.fromJson(json['choosenBook'] as Map<String, dynamic>),
      choosenBookGoogle: json['choosenBookGoogle'] == null
          ? null
          : GoogleBookItem.fromJson(
              json['choosenBookGoogle'] as Map<String, dynamic>),
      heroTag: json['heroTag'] as String? ?? '',
      bookProgress:
          $enumDecodeNullable(_$BookProgressEnumMap, json['bookProgress']) ??
              BookProgress.inProgress,
    );

Map<String, dynamic> _$BookStateToJson(BookState instance) => <String, dynamic>{
      'status': _$BookStateStatusEnumMap[instance.status]!,
      'booksRed': instance.booksRed.map((e) => e.toJson()).toList(),
      'booksToRead': instance.booksToRead.map((e) => e.toJson()).toList(),
      'booksReading': instance.booksReading.map((e) => e.toJson()).toList(),
      'recomendedBooks':
          instance.recomendedBooks.map((e) => e.toJson()).toList(),
      'googleBooks': instance.googleBooks.map((e) => e.toJson()).toList(),
      'chosenList': instance.chosenList.map((e) => e.toJson()).toList(),
      'bookForm': instance.bookForm.toJson(),
      'choosenBook': instance.choosenBook.toJson(),
      'choosenBookGoogle': instance.choosenBookGoogle?.toJson(),
      'heroTag': instance.heroTag,
      'bookProgress': _$BookProgressEnumMap[instance.bookProgress]!,
    };

const _$BookStateStatusEnumMap = {
  BookStateStatus.initial: 'initial',
  BookStateStatus.withData: 'withData',
  BookStateStatus.loadingData: 'loadingData',
};

const _$BookProgressEnumMap = {
  BookProgress.red: 'red',
  BookProgress.toRead: 'toRead',
  BookProgress.inProgress: 'inProgress',
};
