// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookItem _$GoogleBookItemFromJson(Map<String, dynamic> json) =>
    GoogleBookItem(
      id: json['id'] as String,
      selfLink: json['selfLink'] as String,
      volumeInfo:
          GoogleVolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      searchInfo: (json['searchInfo'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$GoogleBookItemToJson(GoogleBookItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo.toJson(),
      'searchInfo': instance.searchInfo,
    };

GoogleVolumeInfo _$GoogleVolumeInfoFromJson(Map<String, dynamic> json) =>
    GoogleVolumeInfo(
      json['title'] as String,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publisher'] as String?,
      json['publishedDate'] as String?,
      json['description'] as String?,
      (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      json['pageCount'] as int?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['averageRating'] as num?)?.toDouble(),
      (json['imageLinks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$GoogleVolumeInfoToJson(GoogleVolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'imageLinks': instance.imageLinks,
    };

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      author: json['author'] as String? ?? '',
      pages: json['pages'] as String? ?? '',
      yearOfEnd: json['yearOfEnd'] as String? ?? '',
      score: json['score'] as int? ?? 0,
      urlPhoto: json['urlPhoto'] as String? ?? Utils.basicBookPhoto,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      bookProgress: $enumDecode(_$BookProgressEnumMap, json['bookProgress']),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'pages': instance.pages,
      'yearOfEnd': instance.yearOfEnd,
      'score': instance.score,
      'urlPhoto': instance.urlPhoto,
      'notes': instance.notes,
      'bookProgress': _$BookProgressEnumMap[instance.bookProgress]!,
    };

const _$BookProgressEnumMap = {
  BookProgress.red: 'red',
  BookProgress.toRead: 'toRead',
  BookProgress.inProgress: 'inProgress',
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
