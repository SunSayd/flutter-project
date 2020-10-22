// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'street.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Street _$StreetFromJson(Map<String, dynamic> json) {
  return Street(
    json['gpsName'] as String,
    json['id'] as int,
    json['name'] as String,
    json['projectId'] as int,
    (json['cantileverAngle'] as num)?.toDouble(),
    (json['lightSourceHeight'] as num)?.toDouble(),
    (json['lightSourcePower'] as num)?.toDouble(),
    (json['roadWidth'] as num)?.toDouble(),
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
    json['lsSupportTypeId'] as int,
    json['lsSupportTypeName'] as String,
    json['roadCategoryId'] as int,
    json['roadCategoryName'] as String,
    json['comment'] as String,
  );
}

Map<String, dynamic> _$StreetToJson(Street instance) => <String, dynamic>{
      'gpsName': instance.gpsName,
      'id': instance.id,
      'name': instance.name,
      'projectId': instance.projectId,
      'cantileverAngle': instance.cantileverAngle,
      'lightSourceHeight': instance.lightSourceHeight,
      'lightSourcePower': instance.lightSourcePower,
      'roadWidth': instance.roadWidth,
      'lat': instance.lat,
      'lon': instance.lon,
      'lsSupportTypeId': instance.lsSupportTypeId,
      'lsSupportTypeName': instance.lsSupportTypeName,
      'roadCategoryId': instance.roadCategoryId,
      'roadCategoryName': instance.roadCategoryName,
      'comment': instance.comment,
    };
