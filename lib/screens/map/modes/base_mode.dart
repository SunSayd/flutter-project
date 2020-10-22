import 'package:flutter/material.dart';
import 'package:sunrise_map/models/light_support.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';

abstract class BaseMode {
  final MapScreenController mapScreenController;

  BaseMode(this.mapScreenController);

  Widget get layout;

  void updateState(Map kwargs);

  void onLSMarkerTap(LightSupport ls) {}
}
