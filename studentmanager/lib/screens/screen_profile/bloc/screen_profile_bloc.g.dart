// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_profile_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenProfileState _$ScreenProfileStateFromJson(Map<String, dynamic> json) =>
    ScreenProfileState(
      name: json['name'] as String? ?? '',
      age: json['age'] as int? ?? 0,
      userModelList: (json['userModelList'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ScreenProfileStateToJson(ScreenProfileState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'userModelList': instance.userModelList,
    };