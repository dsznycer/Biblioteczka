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

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String,
      author: json['author'] as String? ?? '',
      pages: json['pages'] as String? ?? '',
      yearOfEnd: json['yearOfEnd'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? 'brak',
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
      'description': instance.description,
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
      category: json['category'] as String? ?? '',
      cover: json['cover'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_BookApiToJson(_$_BookApi instance) =>
    <String, dynamic>{
      'book_id': instance.book_id,
      'name': instance.name,
      'category': instance.category,
      'cover': instance.cover,
      'rating': instance.rating,
      'description': instance.description,
    };

_$_BookApiModel _$$_BookApiModelFromJson(Map<String, dynamic> json) =>
    _$_BookApiModel(
      book_id: json['book_id'] as int,
      name: json['name'] as String,
      cover: json['cover'] as String? ?? Utils.basicBookPhoto,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['brak'],
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      pages: json['pages'] as int? ?? 0,
      published_date: json['published_date'] as String? ?? 'brak',
      synopsis: json['synopsis'] as String? ?? 'brak',
    );

Map<String, dynamic> _$$_BookApiModelToJson(_$_BookApiModel instance) =>
    <String, dynamic>{
      'book_id': instance.book_id,
      'name': instance.name,
      'cover': instance.cover,
      'authors': instance.authors,
      'rating': instance.rating,
      'pages': instance.pages,
      'published_date': instance.published_date,
      'synopsis': instance.synopsis,
    };

_$_GoogleVolumeInfo _$$_GoogleVolumeInfoFromJson(Map<String, dynamic> json) =>
    _$_GoogleVolumeInfo(
      title: json['title'] as String,
      authors: (json['authors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['brak'],
      publisher: json['publisher'] as String? ?? '',
      publishedDate: json['publishedDate'] as String? ?? '',
      description: json['description'] as String? ?? 'Brak opisu :(',
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [
            {'brak': 'brak'}
          ],
      pageCount: json['pageCount'] as int? ?? 0,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['brak'],
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
      imageLinks: (json['imageLinks'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          Utils.basicBookGoogle,
    );

Map<String, dynamic> _$$_GoogleVolumeInfoToJson(_$_GoogleVolumeInfo instance) =>
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
