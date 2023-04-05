import 'package:biblioteczka/data/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserApp with _$UserApp {
  const factory UserApp({
    required String id,
    @Default('') String name,
    @Default('') String email,
    @Default(Utils.basicUrlUser) String photo,
  }) = _UserApp;

  factory UserApp.fromJson(Map<String, dynamic> json) =>
      _$UserAppFromJson(json);
}
