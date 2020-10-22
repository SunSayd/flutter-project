// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Controller _$ControllerFromJson(Map<String, dynamic> json) {
  return Controller(
    json['id'] as int,
    json['addressDec'] as int,
    json['addressHex'] as String,
  );
}

Map<String, dynamic> _$ControllerToJson(Controller instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressDec': instance.addressDec,
      'addressHex': instance.addressHex,
    };
