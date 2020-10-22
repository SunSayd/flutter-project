import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';

class ControlClosetLayout extends StatefulWidget {
  final MapScreenController controller;

  const ControlClosetLayout({Key key, this.controller}) : super(key: key);

  @override
  _ControlClosetLayoutState createState() => _ControlClosetLayoutState();
}

class _ControlClosetLayoutState extends State<ControlClosetLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: null,
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
              Container(
                height: 8,
                width: 0,
              ),
              FloatingActionButton(
                heroTag: null,
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
              Container(
                height: 8,
                width: 0,
              ),
              FloatingActionButton(
                heroTag: null,
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
