// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_support.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightSupport _$LightSupportFromJson(Map<String, dynamic> json) {
  return LightSupport(
    id: json['id'] as int,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    lightSourceIds:
        (json['lightSourceIds'] as List)?.map((e) => e as int)?.toList(),
    number: json['number'] as String,
    streetId: json['streetId'] as int,
    streetName: json['streetName'] as String,
    comment: json['comment'] as String,
    height: (json['height'] as num)?.toDouble(),
    kind: json['kind'] as String,
    lightSourceCount: json['lightSourceCount'] as int,
    switchboardId: json['switchboardId'] as int,
    typeId: json['typeId'] as int,
  );
}

Map<String, dynamic> _$LightSupportToJson(LightSupport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'lightSourceIds': instance.lightSourceIds,
      'number': instance.number,
      'streetId': instance.streetId,
      'streetName': instance.streetName,
      'comment': instance.comment,
      'height': instance.height,
      'kind': instance.kind,
      'lightSourceCount': instance.lightSourceCount,
      'switchboardId': instance.switchboardId,
      'typeId': instance.typeId,
    };
