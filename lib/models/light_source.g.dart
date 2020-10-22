// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightSource _$LightSourceFromJson(Map<String, dynamic> json) {
  return LightSource(
    json['addressDec'] as int,
    json['addressHex'] as String,
    json['id'] as int,
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
    json['lsSupportId'] as int,
    json['streetId'] as int,
    json['typeId'] as int,
  );
}

Map<String, dynamic> _$LightSourceToJson(LightSource instance) =>
    <String, dynamic>{
      'addressDec': instance.addressDec,
      'addressHex': instance.addressHex,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'lsSupportId': instance.lsSupportId,
      'streetId': instance.streetId,
      'typeId': instance.typeId,
    };
