import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:sunrise_map/mobx/map.dart';
import 'package:sunrise_map/screens/map/modes/base_mode.dart';
import 'package:sunrise_map/screens/map/modes/fast_light_support_mode.dart';
import 'package:sunrise_map/screens/map/modes/light_support_editor.dart';
import 'package:sunrise_map/screens/map/modes/street_select_mode.dart';

class MapScreenController {
  final MapController controller;
  final VoidCallback _setState;
  final MapStore _store;
  LatLng _currentLocation;

  BaseMode _currentMode;

  Map<MapMode, BaseMode> _modes;

  dynamic activeObject;

  MapScreenController(this.controller, this._setState, this._store) {
    _modes = {
      MapMode.fast_light_support_street_select: StreetSelectMode(this, MapMode.fast_light_support_creation),
      MapMode.fast_light_support_creation: FastLightSupportCrateMode(this),
      MapMode.light_support_editor_street_select: StreetSelectMode(this, MapMode.light_support_editor),
      MapMode.light_support_editor: LightSupportEditorMode(this),
    };
    changeMode(MapMode.light_support_editor_street_select, {});
  }

  void showMyLocation() {
    controller.move(_currentLocation, controller.zoom);
  }

  void changeMode(MapMode mapMode, Map kwargs) {
    _modes[mapMode].updateState(kwargs);
    currentMode = _modes[mapMode];
  }

  BaseMode get currentMode => _currentMode;

  set currentMode(BaseMode value) {
    _currentMode = value;
    _setState();
  }

  set currentLocation(LatLng value) {
    _currentLocation = value;
  }

  MapStore get store => _store;
}

enum MapMode {
  control_closet,
  fast_light_support_street_select,
  fast_light_support_creation,
  light_support_editor_street_select,
  light_support_editor,
}
