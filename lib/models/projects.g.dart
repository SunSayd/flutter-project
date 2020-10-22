// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    json['id'] as int,
    json['name'] as String,
    json['city'] as String,
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };
