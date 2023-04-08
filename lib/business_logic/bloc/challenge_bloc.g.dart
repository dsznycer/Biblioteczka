// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeState _$ChallengeStateFromJson(Map<String, dynamic> json) =>
    ChallengeState(
      listOfChallenges: (json['listOfChallenges'] as List<dynamic>?)
              ?.map((e) => ChallengeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      listOfRedsPages: (json['listOfRedsPages'] as List<dynamic>?)
              ?.map((e) => PagesReadInDay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ChallengeStateToJson(ChallengeState instance) =>
    <String, dynamic>{
      'listOfChallenges':
          instance.listOfChallenges.map((e) => e.toJson()).toList(),
      'listOfRedsPages':
          instance.listOfRedsPages.map((e) => e.toJson()).toList(),
    };
