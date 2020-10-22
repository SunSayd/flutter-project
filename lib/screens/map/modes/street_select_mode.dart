import 'package:flutter/material.dart';
import 'package:sunrise_map/screens/map/layout/street_select_layout.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/base_mode.dart';

class StreetSelectMode extends BaseMode {
  MapMode nextMapMode;

  StreetSelectMode(MapScreenController mapScreenController, this.nextMapMode) : super(mapScreenController);

  @override
  Widget get layout => StreetSelectLayout(
        controller: this.mapScreenController,
        mode: this,
      );

  @override
  void updateState(Map kwargs) async {
    await this.mapScreenController.store.updateStreets();
  }
}
