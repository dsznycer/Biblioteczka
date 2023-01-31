// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookApi _$BookApiFromJson(Map<String, dynamic> json) {
  return _BookApi.fromJson(json);
}

/// @nodoc
mixin _$BookApi {
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookApiCopyWith<BookApi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookApiCopyWith<$Res> {
  factory $BookApiCopyWith(BookApi value, $Res Function(BookApi) then) =
      _$BookApiCopyWithImpl<$Res, BookApi>;
  @useResult
  $Res call({String title, String author});
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
    Object? title = null,
    Object? author = null,
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
  $Res call({String title, String author});
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
    Object? title = null,
    Object? author = null,
  }) {
    return _then(_$_BookApi(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookApi with DiagnosticableTreeMixin implements _BookApi {
  const _$_BookApi({required this.title, required this.author});

  factory _$_BookApi.fromJson(Map<String, dynamic> json) =>
      _$$_BookApiFromJson(json);

  @override
  final String title;
  @override
  final String author;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookApi(title: $title, author: $author)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookApi'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('author', author));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookApi &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, author);

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
      {required final String title, required final String author}) = _$_BookApi;

  factory _BookApi.fromJson(Map<String, dynamic> json) = _$_BookApi.fromJson;

  @override
  String get title;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$_BookApiCopyWith<_$_BookApi> get copyWith =>
      throw _privateConstructorUsedError;
}
