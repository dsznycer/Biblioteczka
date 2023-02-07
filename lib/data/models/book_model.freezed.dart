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
  int get score => throw _privateConstructorUsedError;
  List<String>? get notes => throw _privateConstructorUsedError;

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
      int score,
      List<String>? notes});
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
    Object? notes = freezed,
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
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      int score,
      List<String>? notes});
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
    Object? notes = freezed,
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
              as int,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Book with DiagnosticableTreeMixin implements _Book {
  const _$_Book(
      {required this.title,
      required this.author,
      required this.pages,
      required this.yearOfEnd,
      this.score = 0,
      final List<String>? notes})
      : _notes = notes;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String title;
  @override
  final String author;
  @override
  final String pages;
  @override
  final String yearOfEnd;
  @override
  @JsonKey()
  final int score;
  final List<String>? _notes;
  @override
  List<String>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(title: $title, author: $author, pages: $pages, yearOfEnd: $yearOfEnd, score: $score, notes: $notes)';
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
      ..add(DiagnosticsProperty('notes', notes));
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
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, author, pages, yearOfEnd,
      score, const DeepCollectionEquality().hash(_notes));

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
      required final String author,
      required final String pages,
      required final String yearOfEnd,
      final int score,
      final List<String>? notes}) = _$_Book;

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
  int get score;
  @override
  List<String>? get notes;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookApiCopyWith<BookApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookApiCopyWith<$Res> {
  factory $BookApiCopyWith(BookApi value, $Res Function(BookApi) then) =
      _$BookApiCopyWithImpl<$Res, BookApi>;
  @useResult
  $Res call({String book_id, String name, String category, String cover});
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
  $Res call({String book_id, String name, String category, String cover});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookApi with DiagnosticableTreeMixin implements _BookApi {
  const _$_BookApi(
      {required this.book_id,
      required this.name,
      required this.category,
      required this.cover});

  factory _$_BookApi.fromJson(Map<String, dynamic> json) =>
      _$$_BookApiFromJson(json);

  @override
  final String book_id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String cover;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookApi(book_id: $book_id, name: $name, category: $category, cover: $cover)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookApi'))
      ..add(DiagnosticsProperty('book_id', book_id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('cover', cover));
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
            (identical(other.cover, cover) || other.cover == cover));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, book_id, name, category, cover);

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
      required final String category,
      required final String cover}) = _$_BookApi;

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
  @JsonKey(ignore: true)
  _$$_BookApiCopyWith<_$_BookApi> get copyWith =>
      throw _privateConstructorUsedError;
}
