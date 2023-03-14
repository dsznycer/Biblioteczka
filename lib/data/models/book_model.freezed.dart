// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get pages => throw _privateConstructorUsedError;
  String get yearOfEnd => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get urlPhoto => throw _privateConstructorUsedError;
  List<String> get notes => throw _privateConstructorUsedError;
  BookProgress get bookProgress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String title,
      String author,
      String pages,
      String yearOfEnd,
      double score,
      String urlPhoto,
      List<String> notes,
      BookProgress bookProgress});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? pages = null,
    Object? yearOfEnd = null,
    Object? score = null,
    Object? urlPhoto = null,
    Object? notes = null,
    Object? bookProgress = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfEnd: null == yearOfEnd
          ? _value.yearOfEnd
          : yearOfEnd // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      urlPhoto: null == urlPhoto
          ? _value.urlPhoto
          : urlPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookProgress: null == bookProgress
          ? _value.bookProgress
          : bookProgress // ignore: cast_nullable_to_non_nullable
              as BookProgress,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String author,
      String pages,
      String yearOfEnd,
      double score,
      String urlPhoto,
      List<String> notes,
      BookProgress bookProgress});
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? author = null,
    Object? pages = null,
    Object? yearOfEnd = null,
    Object? score = null,
    Object? urlPhoto = null,
    Object? notes = null,
    Object? bookProgress = null,
  }) {
    return _then(_$_Book(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfEnd: null == yearOfEnd
          ? _value.yearOfEnd
          : yearOfEnd // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      urlPhoto: null == urlPhoto
          ? _value.urlPhoto
          : urlPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookProgress: null == bookProgress
          ? _value.bookProgress
          : bookProgress // ignore: cast_nullable_to_non_nullable
              as BookProgress,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Book with DiagnosticableTreeMixin implements _Book {
  const _$_Book(
      {required this.title,
      this.author = '',
      this.pages = '',
      this.yearOfEnd = '',
      this.score = 0,
      this.urlPhoto = Utils.basicBookPhoto,
      final List<String> notes = const [],
      required this.bookProgress})
      : _notes = notes;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String title;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final String pages;
  @override
  @JsonKey()
  final String yearOfEnd;
  @override
  @JsonKey()
  final double score;
  @override
  @JsonKey()
  final String urlPhoto;
  final List<String> _notes;
  @override
  @JsonKey()
  List<String> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final BookProgress bookProgress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, author: $author, pages: $pages, yearOfEnd: $yearOfEnd, score: $score, urlPhoto: $urlPhoto, notes: $notes, bookProgress: $bookProgress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('pages', pages))
      ..add(DiagnosticsProperty('yearOfEnd', yearOfEnd))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('urlPhoto', urlPhoto))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('bookProgress', bookProgress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.yearOfEnd, yearOfEnd) ||
                other.yearOfEnd == yearOfEnd) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.urlPhoto, urlPhoto) ||
                other.urlPhoto == urlPhoto) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.bookProgress, bookProgress) ||
                other.bookProgress == bookProgress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      author,
      pages,
      yearOfEnd,
      score,
      urlPhoto,
      const DeepCollectionEquality().hash(_notes),
      bookProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final String title,
      final String author,
      final String pages,
      final String yearOfEnd,
      final double score,
      final String urlPhoto,
      final List<String> notes,
      required final BookProgress bookProgress}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String get title;
  @override
  String get author;
  @override
  String get pages;
  @override
  String get yearOfEnd;
  @override
  double get score;
  @override
  String get urlPhoto;
  @override
  List<String> get notes;
  @override
  BookProgress get bookProgress;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}

BookApi _$BookApiFromJson(Map<String, dynamic> json) {
  return _BookApi.fromJson(json);
}

/// @nodoc
mixin _$BookApi {
  String get book_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookApiCopyWith<BookApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookApiCopyWith<$Res> {
  factory $BookApiCopyWith(BookApi value, $Res Function(BookApi) then) =
      _$BookApiCopyWithImpl<$Res, BookApi>;
  @useResult
  $Res call(
      {String book_id,
      String name,
      String category,
      String cover,
      double rating,
      String description});
}

/// @nodoc
class _$BookApiCopyWithImpl<$Res, $Val extends BookApi>
    implements $BookApiCopyWith<$Res> {
  _$BookApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? name = null,
    Object? category = null,
    Object? cover = null,
    Object? rating = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookApiCopyWith<$Res> implements $BookApiCopyWith<$Res> {
  factory _$$_BookApiCopyWith(
          _$_BookApi value, $Res Function(_$_BookApi) then) =
      __$$_BookApiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String book_id,
      String name,
      String category,
      String cover,
      double rating,
      String description});
}

/// @nodoc
class __$$_BookApiCopyWithImpl<$Res>
    extends _$BookApiCopyWithImpl<$Res, _$_BookApi>
    implements _$$_BookApiCopyWith<$Res> {
  __$$_BookApiCopyWithImpl(_$_BookApi _value, $Res Function(_$_BookApi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? name = null,
    Object? category = null,
    Object? cover = null,
    Object? rating = null,
    Object? description = null,
  }) {
    return _then(_$_BookApi(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BookApi with DiagnosticableTreeMixin implements _BookApi {
  const _$_BookApi(
      {required this.book_id,
      required this.name,
      this.category = '',
      required this.cover,
      this.rating = 0,
      this.description = ''});

  factory _$_BookApi.fromJson(Map<String, dynamic> json) =>
      _$$_BookApiFromJson(json);

  @override
  final String book_id;
  @override
  final String name;
  @override
  @JsonKey()
  final String category;
  @override
  final String cover;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookApi(book_id: $book_id, name: $name, category: $category, cover: $cover, rating: $rating, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookApi'))
      ..add(DiagnosticsProperty('book_id', book_id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('cover', cover))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookApi &&
            (identical(other.book_id, book_id) || other.book_id == book_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, book_id, name, category, cover, rating, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookApiCopyWith<_$_BookApi> get copyWith =>
      __$$_BookApiCopyWithImpl<_$_BookApi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookApiToJson(
      this,
    );
  }
}

abstract class _BookApi implements BookApi {
  const factory _BookApi(
      {required final String book_id,
      required final String name,
      final String category,
      required final String cover,
      final double rating,
      final String description}) = _$_BookApi;

  factory _BookApi.fromJson(Map<String, dynamic> json) = _$_BookApi.fromJson;

  @override
  String get book_id;
  @override
  String get name;
  @override
  String get category;
  @override
  String get cover;
  @override
  double get rating;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_BookApiCopyWith<_$_BookApi> get copyWith =>
      throw _privateConstructorUsedError;
}

BookApiModel _$BookApiModelFromJson(Map<String, dynamic> json) {
  return _BookApiModel.fromJson(json);
}

/// @nodoc
mixin _$BookApiModel {
  int get book_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  String get published_date => throw _privateConstructorUsedError;
  String get synopsis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookApiModelCopyWith<BookApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookApiModelCopyWith<$Res> {
  factory $BookApiModelCopyWith(
          BookApiModel value, $Res Function(BookApiModel) then) =
      _$BookApiModelCopyWithImpl<$Res, BookApiModel>;
  @useResult
  $Res call(
      {int book_id,
      String name,
      String cover,
      List<String> authors,
      double rating,
      int pages,
      String published_date,
      String synopsis});
}

/// @nodoc
class _$BookApiModelCopyWithImpl<$Res, $Val extends BookApiModel>
    implements $BookApiModelCopyWith<$Res> {
  _$BookApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? name = null,
    Object? cover = null,
    Object? authors = null,
    Object? rating = null,
    Object? pages = null,
    Object? published_date = null,
    Object? synopsis = null,
  }) {
    return _then(_value.copyWith(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      published_date: null == published_date
          ? _value.published_date
          : published_date // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookApiModelCopyWith<$Res>
    implements $BookApiModelCopyWith<$Res> {
  factory _$$_BookApiModelCopyWith(
          _$_BookApiModel value, $Res Function(_$_BookApiModel) then) =
      __$$_BookApiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int book_id,
      String name,
      String cover,
      List<String> authors,
      double rating,
      int pages,
      String published_date,
      String synopsis});
}

/// @nodoc
class __$$_BookApiModelCopyWithImpl<$Res>
    extends _$BookApiModelCopyWithImpl<$Res, _$_BookApiModel>
    implements _$$_BookApiModelCopyWith<$Res> {
  __$$_BookApiModelCopyWithImpl(
      _$_BookApiModel _value, $Res Function(_$_BookApiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? name = null,
    Object? cover = null,
    Object? authors = null,
    Object? rating = null,
    Object? pages = null,
    Object? published_date = null,
    Object? synopsis = null,
  }) {
    return _then(_$_BookApiModel(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      published_date: null == published_date
          ? _value.published_date
          : published_date // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BookApiModel with DiagnosticableTreeMixin implements _BookApiModel {
  const _$_BookApiModel(
      {required this.book_id,
      required this.name,
      required this.cover,
      required final List<String> authors,
      required this.rating,
      required this.pages,
      required this.published_date,
      required this.synopsis})
      : _authors = authors;

  factory _$_BookApiModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookApiModelFromJson(json);

  @override
  final int book_id;
  @override
  final String name;
  @override
  final String cover;
  final List<String> _authors;
  @override
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  final double rating;
  @override
  final int pages;
  @override
  final String published_date;
  @override
  final String synopsis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookApiModel(book_id: $book_id, name: $name, cover: $cover, authors: $authors, rating: $rating, pages: $pages, published_date: $published_date, synopsis: $synopsis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookApiModel'))
      ..add(DiagnosticsProperty('book_id', book_id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('cover', cover))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('pages', pages))
      ..add(DiagnosticsProperty('published_date', published_date))
      ..add(DiagnosticsProperty('synopsis', synopsis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookApiModel &&
            (identical(other.book_id, book_id) || other.book_id == book_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.published_date, published_date) ||
                other.published_date == published_date) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      book_id,
      name,
      cover,
      const DeepCollectionEquality().hash(_authors),
      rating,
      pages,
      published_date,
      synopsis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookApiModelCopyWith<_$_BookApiModel> get copyWith =>
      __$$_BookApiModelCopyWithImpl<_$_BookApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookApiModelToJson(
      this,
    );
  }
}

abstract class _BookApiModel implements BookApiModel {
  const factory _BookApiModel(
      {required final int book_id,
      required final String name,
      required final String cover,
      required final List<String> authors,
      required final double rating,
      required final int pages,
      required final String published_date,
      required final String synopsis}) = _$_BookApiModel;

  factory _BookApiModel.fromJson(Map<String, dynamic> json) =
      _$_BookApiModel.fromJson;

  @override
  int get book_id;
  @override
  String get name;
  @override
  String get cover;
  @override
  List<String> get authors;
  @override
  double get rating;
  @override
  int get pages;
  @override
  String get published_date;
  @override
  String get synopsis;
  @override
  @JsonKey(ignore: true)
  _$$_BookApiModelCopyWith<_$_BookApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

GoogleVolumeInfo _$GoogleVolumeInfoFromJson(Map<String, dynamic> json) {
  return _GoogleVolumeInfo.fromJson(json);
}

/// @nodoc
mixin _$GoogleVolumeInfo {
  String get title => throw _privateConstructorUsedError;
  List<String> get authors => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get publishedDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Map<String, String>> get industryIdentifiers =>
      throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  Map<String, String> get imageLinks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleVolumeInfoCopyWith<GoogleVolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleVolumeInfoCopyWith<$Res> {
  factory $GoogleVolumeInfoCopyWith(
          GoogleVolumeInfo value, $Res Function(GoogleVolumeInfo) then) =
      _$GoogleVolumeInfoCopyWithImpl<$Res, GoogleVolumeInfo>;
  @useResult
  $Res call(
      {String title,
      List<String> authors,
      String publisher,
      String publishedDate,
      String description,
      List<Map<String, String>> industryIdentifiers,
      int pageCount,
      List<String> categories,
      double averageRating,
      Map<String, String> imageLinks});
}

/// @nodoc
class _$GoogleVolumeInfoCopyWithImpl<$Res, $Val extends GoogleVolumeInfo>
    implements $GoogleVolumeInfoCopyWith<$Res> {
  _$GoogleVolumeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? authors = null,
    Object? publisher = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? industryIdentifiers = null,
    Object? pageCount = null,
    Object? categories = null,
    Object? averageRating = null,
    Object? imageLinks = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      industryIdentifiers: null == industryIdentifiers
          ? _value.industryIdentifiers
          : industryIdentifiers // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      imageLinks: null == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleVolumeInfoCopyWith<$Res>
    implements $GoogleVolumeInfoCopyWith<$Res> {
  factory _$$_GoogleVolumeInfoCopyWith(
          _$_GoogleVolumeInfo value, $Res Function(_$_GoogleVolumeInfo) then) =
      __$$_GoogleVolumeInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      List<String> authors,
      String publisher,
      String publishedDate,
      String description,
      List<Map<String, String>> industryIdentifiers,
      int pageCount,
      List<String> categories,
      double averageRating,
      Map<String, String> imageLinks});
}

/// @nodoc
class __$$_GoogleVolumeInfoCopyWithImpl<$Res>
    extends _$GoogleVolumeInfoCopyWithImpl<$Res, _$_GoogleVolumeInfo>
    implements _$$_GoogleVolumeInfoCopyWith<$Res> {
  __$$_GoogleVolumeInfoCopyWithImpl(
      _$_GoogleVolumeInfo _value, $Res Function(_$_GoogleVolumeInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? authors = null,
    Object? publisher = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? industryIdentifiers = null,
    Object? pageCount = null,
    Object? categories = null,
    Object? averageRating = null,
    Object? imageLinks = null,
  }) {
    return _then(_$_GoogleVolumeInfo(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      industryIdentifiers: null == industryIdentifiers
          ? _value._industryIdentifiers
          : industryIdentifiers // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      imageLinks: null == imageLinks
          ? _value._imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoogleVolumeInfo
    with DiagnosticableTreeMixin
    implements _GoogleVolumeInfo {
  const _$_GoogleVolumeInfo(
      {required this.title,
      final List<String> authors = const ['brak'],
      this.publisher = '',
      this.publishedDate = '',
      this.description = 'Brak opisu :(',
      final List<Map<String, String>> industryIdentifiers = const [
        {'brak': 'brak'}
      ],
      this.pageCount = 0,
      final List<String> categories = const ['brak'],
      this.averageRating = 0,
      final Map<String, String> imageLinks = Utils.basicBookGoogle})
      : _authors = authors,
        _industryIdentifiers = industryIdentifiers,
        _categories = categories,
        _imageLinks = imageLinks;

  factory _$_GoogleVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_GoogleVolumeInfoFromJson(json);

  @override
  final String title;
  final List<String> _authors;
  @override
  @JsonKey()
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  @JsonKey()
  final String publisher;
  @override
  @JsonKey()
  final String publishedDate;
  @override
  @JsonKey()
  final String description;
  final List<Map<String, String>> _industryIdentifiers;
  @override
  @JsonKey()
  List<Map<String, String>> get industryIdentifiers {
    if (_industryIdentifiers is EqualUnmodifiableListView)
      return _industryIdentifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_industryIdentifiers);
  }

  @override
  @JsonKey()
  final int pageCount;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final double averageRating;
  final Map<String, String> _imageLinks;
  @override
  @JsonKey()
  Map<String, String> get imageLinks {
    if (_imageLinks is EqualUnmodifiableMapView) return _imageLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_imageLinks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoogleVolumeInfo(title: $title, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, pageCount: $pageCount, categories: $categories, averageRating: $averageRating, imageLinks: $imageLinks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoogleVolumeInfo'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('authors', authors))
      ..add(DiagnosticsProperty('publisher', publisher))
      ..add(DiagnosticsProperty('publishedDate', publishedDate))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('industryIdentifiers', industryIdentifiers))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('averageRating', averageRating))
      ..add(DiagnosticsProperty('imageLinks', imageLinks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleVolumeInfo &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._industryIdentifiers, _industryIdentifiers) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._imageLinks, _imageLinks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_authors),
      publisher,
      publishedDate,
      description,
      const DeepCollectionEquality().hash(_industryIdentifiers),
      pageCount,
      const DeepCollectionEquality().hash(_categories),
      averageRating,
      const DeepCollectionEquality().hash(_imageLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleVolumeInfoCopyWith<_$_GoogleVolumeInfo> get copyWith =>
      __$$_GoogleVolumeInfoCopyWithImpl<_$_GoogleVolumeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoogleVolumeInfoToJson(
      this,
    );
  }
}

abstract class _GoogleVolumeInfo implements GoogleVolumeInfo {
  const factory _GoogleVolumeInfo(
      {required final String title,
      final List<String> authors,
      final String publisher,
      final String publishedDate,
      final String description,
      final List<Map<String, String>> industryIdentifiers,
      final int pageCount,
      final List<String> categories,
      final double averageRating,
      final Map<String, String> imageLinks}) = _$_GoogleVolumeInfo;

  factory _GoogleVolumeInfo.fromJson(Map<String, dynamic> json) =
      _$_GoogleVolumeInfo.fromJson;

  @override
  String get title;
  @override
  List<String> get authors;
  @override
  String get publisher;
  @override
  String get publishedDate;
  @override
  String get description;
  @override
  List<Map<String, String>> get industryIdentifiers;
  @override
  int get pageCount;
  @override
  List<String> get categories;
  @override
  double get averageRating;
  @override
  Map<String, String> get imageLinks;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleVolumeInfoCopyWith<_$_GoogleVolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
