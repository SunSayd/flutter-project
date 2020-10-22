import 'package:mobx/mobx.dart';
import 'package:sunrise_map/resources/sr_resource.dart';

part 'controll_closet_layout.g.dart';

class ControlClosetLayoutStore = ControlClosetLayoutBase with _$ControlClosetLayoutStore;

abstract class ControlClosetLayoutBase with Store {
  final SRResource _resource = SRResource();

}