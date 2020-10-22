import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sunrise_map/models/street.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/street_select_mode.dart';

class StreetSelectLayout extends StatefulWidget {
  final MapScreenController controller;
  final StreetSelectMode mode;

  const StreetSelectLayout({Key key, this.controller, this.mode}) : super(key: key);

  @override
  _StreetSelectLayoutState createState() => _StreetSelectLayoutState();
}

class _StreetSelectLayoutState extends State<StreetSelectLayout> {
  @override
  void initState() {
    super.initState();
    widget.controller.store.updateStreets();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      List<Street> streets = widget.controller.store.streets;
      if (streets == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 86,
                padding: EdgeInsets.only(bottom: 24),
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: streets.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      if (i == 0) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {},
                            child: Chip(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                elevation: 4,
                                label: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    Text(
                                      "Поиск",
                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.white),
                          ),
                        );
                      }
                      Street street = streets[i - 1];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            widget.controller.changeMode(widget.mode.nextMapMode, {"street": street});
                          },
                          child: Chip(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              elevation: 4,
                              label: Text(
                                street.name,
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              backgroundColor: Colors.white),
                        ),
                      );
                    }),
              ))
        ],
      );
    });
  }
}
