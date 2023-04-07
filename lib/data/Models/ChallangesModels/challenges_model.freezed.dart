// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return _ChallengeItem.fromJson(json);
}

/// @nodoc
mixin _$ChallengeItem {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dateOfStart => throw _privateConstructorUsedError;
  int get monthsToFinish => throw _privateConstructorUsedError;
  int get booksToRead => throw _privateConstructorUsedError;
  int get booksread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChallengeItemCopyWith<ChallengeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeItemCopyWith<$Res> {
  factory $ChallengeItemCopyWith(
          ChallengeItem value, $Res Function(ChallengeItem) then) =
      _$ChallengeItemCopyWithImpl<$Res, ChallengeItem>;
  @useResult
  $Res call(
      {String name,
      String description,
      DateTime dateOfStart,
      int monthsToFinish,
      int booksToRead,
      int booksread});
}

/// @nodoc
class _$ChallengeItemCopyWithImpl<$Res, $Val extends ChallengeItem>
    implements $ChallengeItemCopyWith<$Res> {
  _$ChallengeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? dateOfStart = null,
    Object? monthsToFinish = null,
    Object? booksToRead = null,
    Object? booksread = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfStart: null == dateOfStart
          ? _value.dateOfStart
          : dateOfStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthsToFinish: null == monthsToFinish
          ? _value.monthsToFinish
          : monthsToFinish // ignore: cast_nullable_to_non_nullable
              as int,
      booksToRead: null == booksToRead
          ? _value.booksToRead
          : booksToRead // ignore: cast_nullable_to_non_nullable
              as int,
      booksread: null == booksread
          ? _value.booksread
          : booksread // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChallengeItemCopyWith<$Res>
    implements $ChallengeItemCopyWith<$Res> {
  factory _$$_ChallengeItemCopyWith(
          _$_ChallengeItem value, $Res Function(_$_ChallengeItem) then) =
      __$$_ChallengeItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      DateTime dateOfStart,
      int monthsToFinish,
      int booksToRead,
      int booksread});
}

/// @nodoc
class __$$_ChallengeItemCopyWithImpl<$Res>
    extends _$ChallengeItemCopyWithImpl<$Res, _$_ChallengeItem>
    implements _$$_ChallengeItemCopyWith<$Res> {
  __$$_ChallengeItemCopyWithImpl(
      _$_ChallengeItem _value, $Res Function(_$_ChallengeItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? dateOfStart = null,
    Object? monthsToFinish = null,
    Object? booksToRead = null,
    Object? booksread = null,
  }) {
    return _then(_$_ChallengeItem(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfStart: null == dateOfStart
          ? _value.dateOfStart
          : dateOfStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      monthsToFinish: null == monthsToFinish
          ? _value.monthsToFinish
          : monthsToFinish // ignore: cast_nullable_to_non_nullable
              as int,
      booksToRead: null == booksToRead
          ? _value.booksToRead
          : booksToRead // ignore: cast_nullable_to_non_nullable
              as int,
      booksread: null == booksread
          ? _value.booksread
          : booksread // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChallengeItem with DiagnosticableTreeMixin implements _ChallengeItem {
  const _$_ChallengeItem(
      {required this.name,
      this.description = '',
      required this.dateOfStart,
      required this.monthsToFinish,
      required this.booksToRead,
      this.booksread = 0});

  factory _$_ChallengeItem.fromJson(Map<String, dynamic> json) =>
      _$$_ChallengeItemFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime dateOfStart;
  @override
  final int monthsToFinish;
  @override
  final int booksToRead;
  @override
  @JsonKey()
  final int booksread;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChallengeItem(name: $name, description: $description, dateOfStart: $dateOfStart, monthsToFinish: $monthsToFinish, booksToRead: $booksToRead, booksread: $booksread)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChallengeItem'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('dateOfStart', dateOfStart))
      ..add(DiagnosticsProperty('monthsToFinish', monthsToFinish))
      ..add(DiagnosticsProperty('booksToRead', booksToRead))
      ..add(DiagnosticsProperty('booksread', booksread));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChallengeItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateOfStart, dateOfStart) ||
                other.dateOfStart == dateOfStart) &&
            (identical(other.monthsToFinish, monthsToFinish) ||
                other.monthsToFinish == monthsToFinish) &&
            (identical(other.booksToRead, booksToRead) ||
                other.booksToRead == booksToRead) &&
            (identical(other.booksread, booksread) ||
                other.booksread == booksread));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, dateOfStart,
      monthsToFinish, booksToRead, booksread);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChallengeItemCopyWith<_$_ChallengeItem> get copyWith =>
      __$$_ChallengeItemCopyWithImpl<_$_ChallengeItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChallengeItemToJson(
      this,
    );
  }
}

abstract class _ChallengeItem implements ChallengeItem {
  const factory _ChallengeItem(
      {required final String name,
      final String description,
      required final DateTime dateOfStart,
      required final int monthsToFinish,
      required final int booksToRead,
      final int booksread}) = _$_ChallengeItem;

  factory _ChallengeItem.fromJson(Map<String, dynamic> json) =
      _$_ChallengeItem.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get dateOfStart;
  @override
  int get monthsToFinish;
  @override
  int get booksToRead;
  @override
  int get booksread;
  @override
  @JsonKey(ignore: true)
  _$$_ChallengeItemCopyWith<_$_ChallengeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

PagesRedInDay _$PagesRedInDayFromJson(Map<String, dynamic> json) {
  return _PagesRedInDay.fromJson(json);
}

/// @nodoc
mixin _$PagesRedInDay {
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagesRedInDayCopyWith<PagesRedInDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagesRedInDayCopyWith<$Res> {
  factory $PagesRedInDayCopyWith(
          PagesRedInDay value, $Res Function(PagesRedInDay) then) =
      _$PagesRedInDayCopyWithImpl<$Res, PagesRedInDay>;
  @useResult
  $Res call({DateTime dateTime, int pages});
}

/// @nodoc
class _$PagesRedInDayCopyWithImpl<$Res, $Val extends PagesRedInDay>
    implements $PagesRedInDayCopyWith<$Res> {
  _$PagesRedInDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? pages = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagesRedInDayCopyWith<$Res>
    implements $PagesRedInDayCopyWith<$Res> {
  factory _$$_PagesRedInDayCopyWith(
          _$_PagesRedInDay value, $Res Function(_$_PagesRedInDay) then) =
      __$$_PagesRedInDayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, int pages});
}

/// @nodoc
class __$$_PagesRedInDayCopyWithImpl<$Res>
    extends _$PagesRedInDayCopyWithImpl<$Res, _$_PagesRedInDay>
    implements _$$_PagesRedInDayCopyWith<$Res> {
  __$$_PagesRedInDayCopyWithImpl(
      _$_PagesRedInDay _value, $Res Function(_$_PagesRedInDay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? pages = null,
  }) {
    return _then(_$_PagesRedInDay(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PagesRedInDay with DiagnosticableTreeMixin implements _PagesRedInDay {
  const _$_PagesRedInDay({required this.dateTime, required this.pages});

  factory _$_PagesRedInDay.fromJson(Map<String, dynamic> json) =>
      _$$_PagesRedInDayFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final int pages;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PagesRedInDay(dateTime: $dateTime, pages: $pages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PagesRedInDay'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('pages', pages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagesRedInDay &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, pages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagesRedInDayCopyWith<_$_PagesRedInDay> get copyWith =>
      __$$_PagesRedInDayCopyWithImpl<_$_PagesRedInDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PagesRedInDayToJson(
      this,
    );
  }
}

abstract class _PagesRedInDay implements PagesRedInDay {
  const factory _PagesRedInDay(
      {required final DateTime dateTime,
      required final int pages}) = _$_PagesRedInDay;

  factory _PagesRedInDay.fromJson(Map<String, dynamic> json) =
      _$_PagesRedInDay.fromJson;

  @override
  DateTime get dateTime;
  @override
  int get pages;
  @override
  @JsonKey(ignore: true)
  _$$_PagesRedInDayCopyWith<_$_PagesRedInDay> get copyWith =>
      throw _privateConstructorUsedError;
}
