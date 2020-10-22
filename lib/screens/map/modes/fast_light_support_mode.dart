import 'package:flutter/src/widgets/framework.dart';
import 'package:sunrise_map/models/light_support.dart';
import 'package:sunrise_map/models/street.dart';
import 'package:sunrise_map/screens/map/layout/fast_ls_create_layout.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/base_mode.dart';



class FastLightSupportCrateMode extends BaseMode {
  Street selectedStreet;

  FastLightSupportCrateMode(MapScreenController mapScreenController) : super(mapScreenController);

  @override
  Widget get layout => FastLightSupportCreateLayout(
        controller: this.mapScreenController,
        mode: this,
      );

  @override
  void updateState(Map kwargs) async {
    Street street = kwargs["street"];
    this.selectedStreet = street;
    await this.mapScreenController.store.updateLightSupports();
    List<LightSupport> displaySupports =
        List.of(mapScreenController.store.lightSupports.where((element) => element.streetId == street.id));
    mapScreenController.store.setDisplayLightSupport(displaySupports);
  }
}
