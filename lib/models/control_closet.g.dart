// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_closet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlCloset _$ControlClosetFromJson(Map<String, dynamic> json) {
  return ControlCloset(
    canEditMobile: json['canEditMobile'] as bool,
    comment: json['comment'] as String,
    id: json['id'] as int,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    phaseCount: json['phaseCount'] as int,
    phone: json['phone'] as String,
    powerPhase1: (json['powerPhase1'] as num)?.toDouble(),
    powerPhase2: (json['powerPhase2'] as num)?.toDouble(),
    powerPhase3: (json['powerPhase3'] as num)?.toDouble(),
    serialNumberDec: json['serialNumberDec'] as String,
    serialNumberHex: json['serialNumberHex'] as String,
    tp: json['tp'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$ControlClosetToJson(ControlCloset instance) =>
    <String, dynamic>{
      'canEditMobile': instance.canEditMobile,
      'comment': instance.comment,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'phaseCount': instance.phaseCount,
      'phone': instance.phone,
      'powerPhase1': instance.powerPhase1,
      'powerPhase2': instance.powerPhase2,
      'powerPhase3': instance.powerPhase3,
      'serialNumberDec': instance.serialNumberDec,
      'serialNumberHex': instance.serialNumberHex,
      'tp': instance.tp,
      'uuid': instance.uuid,
    };
