import 'package:json_annotation/json_annotation.dart';

part 'projects.g.dart';

@JsonSerializable()
class Project {
  int id;
  String name;
  String city;

  Project(this.id, this.name, this.city);

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
