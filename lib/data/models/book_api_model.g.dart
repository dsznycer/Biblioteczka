// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookApi _$$_BookApiFromJson(Map<String, dynamic> json) => _$_BookApi(
      json['timestamp'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$$_BookApiToJson(_$_BookApi instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'title': instance.title,
      'author': instance.author,
    };
