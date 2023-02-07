// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookItem _$GoogleBookItemFromJson(Map<String, dynamic> json) =>
    GoogleBookItem(
      googleId: json['googleId'] as String,
      etag: json['etag'] as String,
      selfLink: json['selfLink'] as String,
    );

Map<String, dynamic> _$GoogleBookItemToJson(GoogleBookItem instance) =>
    <String, dynamic>{
      'googleId': instance.googleId,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
    };

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      author: json['author'] as String,
      pages: json['pages'] as String,
      yearOfEnd: json['yearOfEnd'] as String,
      score: json['score'] as int? ?? 0,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'pages': instance.pages,
      'yearOfEnd': instance.yearOfEnd,
      'score': instance.score,
      'notes': instance.notes,
    };

_$_BookApi _$$_BookApiFromJson(Map<String, dynamic> json) => _$_BookApi(
      book_id: json['book_id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      cover: json['cover'] as String,
    );

Map<String, dynamic> _$$_BookApiToJson(_$_BookApi instance) =>
    <String, dynamic>{
      'book_id': instance.book_id,
      'name': instance.name,
      'category': instance.category,
      'cover': instance.cover,
    };
