import 'package:flutter/material.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/fast_light_support_mode.dart';

class FastLightSupportCreateLayout extends StatefulWidget {
  final MapScreenController controller;
  final FastLightSupportCrateMode mode;

  const FastLightSupportCreateLayout({Key key, this.controller, this.mode}) : super(key: key);

  @override
  _FastLightSupportCreateLayoutState createState() => _FastLightSupportCreateLayoutState();
}

class _FastLightSupportCreateLayoutState extends State<FastLightSupportCreateLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Text(
              widget.mode.selectedStreet.getInfo(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.gps_not_fixed,
            color: Colors.black,
            size: 36,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Добавить\nБЕЗ светильников"),
                    color: Colors.white,
                    colorBrightness: Brightness.light,
                  ),
                ),
                Container(
                  width: 8,
                  height: 0,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Добавить\nСО светильников"),
                    color: Colors.white,
                    colorBrightness: Brightness.light,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
