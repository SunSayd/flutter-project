import 'package:json_annotation/json_annotation.dart';

part 'light_support.g.dart';

@JsonSerializable()
class LightSupport {
  int id;
  double lat;
  double lon;
  List<int> lightSourceIds;
  String number;
  int streetId;
  String streetName;
  String comment;
  double height;
  String kind;
  int lightSourceCount;
  int switchboardId;
  int typeId;

  LightSupport(
      {this.id,
      this.lat,
      this.lon,
      this.lightSourceIds,
      this.number,
      this.streetId,
      this.streetName,
      this.comment,
      this.height,
      this.kind,
      this.lightSourceCount,
      this.switchboardId,
      this.typeId});

  factory LightSupport.fromJson(Map<String, dynamic> json) => _$LightSupportFromJson(json);

  Map<String, dynamic> toJson() => _$LightSupportToJson(this);

  String getInfo() {
    return """
№ опоры: ${this.number}
Комментарий: ${this.comment != null ? this.comment : "нет"}
Высота: ${this.height != null ? this.height.toString() :"не указана"}
Тип: ${this.kind != null ? this.kind : "не указан"}
Улица: ${this.streetName}
Кол-во светильников: ${this.lightSourceCount}
    """.trim();
  }
}
