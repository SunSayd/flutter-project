import 'package:mobx/mobx.dart';
import 'package:sunrise_map/models/control_closet.dart';
import 'package:sunrise_map/models/controller.dart';
import 'package:sunrise_map/models/light_source.dart';
import 'package:sunrise_map/models/light_support.dart';
import 'package:sunrise_map/models/projects.dart';
import 'package:sunrise_map/models/response.dart';
import 'package:sunrise_map/models/street.dart';
import 'package:sunrise_map/resources/sr_resource.dart';

part 'map.g.dart';

class MapStore = MapBase with _$MapStore;

abstract class MapBase with Store {
  final SRResource _resource = SRResource();
  final Project project;

  List<ControlCloset> closets;
  List<LightSupport> lightSupports;
  List<LightSource> lightSources;

  @observable
  List<Street> streets;

  @observable
  List<ControlCloset> displayClosets;

  @observable
  List<LightSupport> displayLS;

  @observable
  LightSupport selectedSupport;

  Map<int, List<Controller>> controller = {};

  MapBase(this.project);

  Future updateClosets() async {
    closets = await _resource.getControlClosets(project.id);
  }

  Future updateLightSupports() async {
    lightSupports = await _resource.getLightSupports(project.id);
  }

  Future updateStreets() async {
    streets = await _resource.getStreets(project.id);
  }

  @action
  void setDisplayClosets(List<ControlCloset> closets) {
    this.displayClosets = closets;
  }

  @action
  void setDisplayLightSupport(List<LightSupport> lightSupports) {
    this.displayLS = lightSupports;
  }

  @action
  void selectLightSupport(LightSupport ls) {
    this.selectedSupport = ls;
  }

  @action
  Future<Response> bindController(String qr) async {
    return await _resource.bindController(project.id, selectedSupport.id, qr);
  }
}
