import 'package:json_annotation/json_annotation.dart';

part 'street.g.dart';

@JsonSerializable()
class Street {
  String gpsName;
  int id;
  String name;
  int projectId;

  double cantileverAngle;
  double lightSourceHeight;
  double lightSourcePower;
  double roadWidth;
  double lat;
  double lon;
  int lsSupportTypeId;
  String lsSupportTypeName;
  int roadCategoryId;
  String roadCategoryName;
  String comment;

  Street(
      this.gpsName,
      this.id,
      this.name,
      this.projectId,
      this.cantileverAngle,
      this.lightSourceHeight,
      this.lightSourcePower,
      this.roadWidth,
      this.lat,
      this.lon,
      this.lsSupportTypeId,
      this.lsSupportTypeName,
      this.roadCategoryId,
      this.roadCategoryName,
      this.comment);

  factory Street.fromJson(Map<String, dynamic> json) => _$StreetFromJson(json);

  Map<String, dynamic> toJson() => _$StreetToJson(this);

  String getInfo() {
    return """
    Высота подвеса: ${this.lightSourceHeight.toString()}
    Ширина дороги: ${this.roadWidth.toString()}
    Тип светильника: ${this.lsSupportTypeName}
    Мощность: ${this.lightSourcePower.toString()}
    Угол кронштейна: ${this.cantileverAngle.toString()}
    """;
  }
}
