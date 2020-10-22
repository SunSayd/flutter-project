import 'package:json_annotation/json_annotation.dart';

part 'control_closet.g.dart';

@JsonSerializable()
class ControlCloset {
  bool canEditMobile;
  String comment;
  int id;
  double lat;
  double lon;
  int phaseCount;
  String phone;
  double powerPhase1;
  double powerPhase2;
  double powerPhase3;
  String serialNumberDec;
  String serialNumberHex;
  String tp;
  String uuid;


  ControlCloset(
  {this.canEditMobile = true,
      this.comment = "",
      this.id,
      this.lat,
      this.lon,
      this.phaseCount = 1,
      this.phone,
      this.powerPhase1,
      this.powerPhase2,
      this.powerPhase3,
      this.serialNumberDec,
      this.serialNumberHex,
      this.tp,
      this.uuid});

  factory ControlCloset.fromJson(Map<String, dynamic> json) => _$ControlClosetFromJson(json);

  Map<String, dynamic> toJson() => _$ControlClosetToJson(this);
}
