import 'package:json_annotation/json_annotation.dart';

part 'light_source.g.dart';

@JsonSerializable()
class LightSource {
  int addressDec;
  String addressHex;
  int id;
  double lat;
  double lon;
  int lsSupportId;
  int streetId;
  int typeId;

  LightSource(
      this.addressDec, this.addressHex, this.id, this.lat, this.lon, this.lsSupportId, this.streetId, this.typeId);

  factory LightSource.fromJson(Map<String, dynamic> json) => _$LightSourceFromJson(json);

  Map<String, dynamic> toJson() => _$LightSourceToJson(this);
}
