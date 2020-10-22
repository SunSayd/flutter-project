import 'package:json_annotation/json_annotation.dart';

part 'controller.g.dart';

@JsonSerializable()
class Controller {
  int id;
  int addressDec;
  String addressHex;

  Controller(this.id, this.addressDec, this.addressHex);

  factory Controller.fromJson(Map<String, dynamic> json) => _$ControllerFromJson(json);

  Map<String, dynamic> toJson() => _$ControllerToJson(this);
}
