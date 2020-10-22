import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:sunrise_map/screens/map/map_controller.dart';
import 'package:sunrise_map/screens/map/modes/light_support_editor.dart';

class LightSupportEditorLayout extends StatefulWidget {
  final MapScreenController controller;
  final LightSupportEditorMode mode;

  const LightSupportEditorLayout({Key key, this.controller, this.mode}) : super(key: key);

  @override
  _LightSupportEditorLayoutState createState() => _LightSupportEditorLayoutState();
}

class _LightSupportEditorLayoutState extends State<LightSupportEditorLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.mode.currentLS != null)
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.mode.currentLS.getInfo(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.mode.currentLS != null)
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    widget.mode.nextLS();
                  },
                ),
              Container(
                height: 8,
                width: 0,
              ),
              if (widget.mode.currentLS != null)
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    widget.mode.prevLS();
                  },
                ),
              Container(
                height: 8,
                width: 0,
              ),
              FloatingActionButton(
                heroTag: null,
                mini: true,
                backgroundColor: Colors.white,
                child: Icon(Icons.gps_fixed, color: Colors.black),
                onPressed: () {
                  widget.controller.showMyLocation();
                },
              ),
            ],
          ),
        ),
        if (widget.mode.currentLS != null)
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 16, bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    height: 0,
                    width: 8,
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _scanCode();
                    },
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.mode.setState = () {
      setState(() {});
    };
  }

  _scanCode() async {
    var options = ScanOptions(strings: {
      "cancel": "Отмена",
      "flash_on": "Вкл. вспышку",
      "flash_off": "Выкл. вспышку",
    }, useCamera: 1);
    var result = await BarcodeScanner.scan(options: options);
    print(result);
    if (result.rawContent == null) return;
    print(result.rawContent);
    if (result.rawContent.startsWith("http://online.svetosystem.ru/qrcode/") ||
        result.rawContent.startsWith("https://online.svetosystem.ru/qrcode/")) {
      var res = await widget.controller.store.bindController(result.rawContent.split("/").last);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(res.success ? "Контроллер привязан" : res.errors[0].message),
            actions: <Widget>[
              FlatButton(
                child: Text('Ок'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Не поддерживаемый вид кода"),
            actions: <Widget>[
              FlatButton(
                child: Text('Ок'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
