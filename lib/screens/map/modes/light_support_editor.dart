import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:sunrise_map/models/light_support.dart';
import 'package:sunrise_map/models/street.dart';
import 'package:sunrise_map/screens/map/layout/ls_editor_layout.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/base_mode.dart';

class LightSupportEditorMode extends BaseMode {
  Street selectedStreet;
  List<LightSupport> sortedLS;
  int selectedLSIndex;

  VoidCallback _setState;

  LightSupportEditorMode(MapScreenController mapScreenController) : super(mapScreenController);

  @override
  Widget get layout => LightSupportEditorLayout(
        controller: this.mapScreenController,
        mode: this,
      );

  @override
  void updateState(Map kwargs) async {
    selectedLSIndex = null;
    sortedLS = null;
    Street street = kwargs["street"];
    this.selectedStreet = street;
    await this.mapScreenController.store.updateLightSupports();
    List<LightSupport> displaySupports =
        List.of(mapScreenController.store.lightSupports.where((element) => element.streetId == street.id));
    mapScreenController.store.setDisplayLightSupport(displaySupports);
    mapScreenController.controller.fitBounds(
        LatLngBounds.fromPoints(displaySupports.map((e) => LatLng(e.lat, e.lon)).toList()),
        options: FitBoundsOptions(padding: EdgeInsets.all(24)));
    sortedLS = List.from(displaySupports);
    sortedLS.sort((a, b) {
      if (a.lon == b.lon) {
        return a.lat.compareTo(b.lat);
      }
      return a.lon.compareTo(a.lon);
    });
    _setState();
  }

  void nextLS() {
    if (selectedLSIndex + 1 >= sortedLS.length)
      selectedLSIndex = 0;
    else
      selectedLSIndex++;
    onLSMarkerTap(sortedLS[selectedLSIndex]);
  }

  void prevLS() {
    if (selectedLSIndex - 1 < 0)
      selectedLSIndex = sortedLS.length - 1;
    else
      selectedLSIndex--;
    onLSMarkerTap(sortedLS[selectedLSIndex]);
  }

  @override
  void onLSMarkerTap(LightSupport ls) {
    this.mapScreenController.store.selectLightSupport(ls);
    this.mapScreenController.controller.move(LatLng(ls.lat, ls.lon), this.mapScreenController.controller.zoom);
    selectedLSIndex = sortedLS.indexOf(ls);
    _setState();
  }

  LightSupport get currentLS {
    if (selectedLSIndex == null) return null;
    if (sortedLS != null) return sortedLS[selectedLSIndex];
    return null;
  }

  set setState(VoidCallback value) {
    _setState = value;
  }
}
