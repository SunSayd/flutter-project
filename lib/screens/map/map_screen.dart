import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong/latlong.dart';
import 'package:sunrise_map/mobx/map.dart';
import 'package:sunrise_map/models/projects.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:user_location/user_location.dart';

class MapScreen extends StatefulWidget {
  final Project project;

  const MapScreen({Key key, this.project}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapStore _store;
  MapScreenController _mapScreenController;
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _store = MapStore(widget.project);
    _mapScreenController = MapScreenController(mapController, () {
      setState(() {});
    }, _store);
  }

  @override
  Widget build(BuildContext context) {
    userLocationOptions = UserLocationOptions(
        context: context,
        mapController: mapController,
        markers: markers,
        showMoveToCurrentLocationFloatingActionButton: false,
        updateMapLocationOnPositionChange: false,
        onLocationUpdate: (location) {
          _mapScreenController.currentLocation = location;
        });

    print("update build");
    return Scaffold(
      body: Stack(
        children: [
          Observer(builder: (context) {
            print("update observe");
            print(_store.displayLS);
            if (_store.displayLS != null && _store.displayLS.isNotEmpty)
              print(_store.displayLS.map((e) => Marker(point: LatLng(e.lat, e.lon))));
            else
              print("NO LS");
            return FlutterMap(
              layers: [
                TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png", subdomains: ['b']),
                MarkerLayerOptions(markers: markers),
                if (_store.displayLS != null && _store.displayLS.isNotEmpty)
                  MarkerLayerOptions(
                    markers: List.of(_store.displayLS.map((e) => Marker(
                        point: LatLng(e.lat, e.lon),
                        width: 24,
                        height: 24,
                        builder: (c) {
                          Color markerColor;
                          if (e == _store.selectedSupport) {
                            markerColor = Colors.yellowAccent;
                          } else {
                            if (e.lightSourceCount < 1)
                              markerColor = Colors.transparent;
                            else
                              markerColor = Colors.green;
                          }
                          return GestureDetector(
                            onTap: () {
                              _mapScreenController.currentMode.onLSMarkerTap(e);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: e.lightSourceCount < 1 ? Border.all(color: Colors.black) : null),
                            ),
                          );
                        }))),
                  ),
                userLocationOptions
              ],
              options: MapOptions(plugins: [UserLocationPlugin()]),
              mapController: mapController,
            );
          }),
          SafeArea(
              child: Align(alignment: Alignment.center, child: _mapScreenController.currentMode.layout ?? Container()))
        ],
      ),
    );
  }
}
