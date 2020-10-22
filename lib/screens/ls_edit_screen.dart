import 'package:flutter/material.dart';
import 'package:sunrise_map/mobx/ls_edit.dart';
import 'package:sunrise_map/models/light_support.dart';

class LSEditScreen extends StatefulWidget {
  final LightSupport lightSupport;

  const LSEditScreen({Key key, this.lightSupport}) : super(key: key);

  @override
  _LSEditScreenState createState() => _LSEditScreenState();
}

class _LSEditScreenState extends State<LSEditScreen> {
  LSEditStore _store;

  @override
  void initState() {
    super.initState();
    _store = LSEditStore(widget.lightSupport);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lightSupport.number),
      ),
      body: ListView(),
    );
  }
}
