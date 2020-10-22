// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on MapBase, Store {
  final _$streetsAtom = Atom(name: 'MapBase.streets');

  @override
  List<Street> get streets {
    _$streetsAtom.reportRead();
    return super.streets;
  }

  @override
  set streets(List<Street> value) {
    _$streetsAtom.reportWrite(value, super.streets, () {
      super.streets = value;
    });
  }

  final _$displayClosetsAtom = Atom(name: 'MapBase.displayClosets');

  @override
  List<ControlCloset> get displayClosets {
    _$displayClosetsAtom.reportRead();
    return super.displayClosets;
  }

  @override
  set displayClosets(List<ControlCloset> value) {
    _$displayClosetsAtom.reportWrite(value, super.displayClosets, () {
      super.displayClosets = value;
    });
  }

  final _$displayLSAtom = Atom(name: 'MapBase.displayLS');

  @override
  List<LightSupport> get displayLS {
    _$displayLSAtom.reportRead();
    return super.displayLS;
  }

  @override
  set displayLS(List<LightSupport> value) {
    _$displayLSAtom.reportWrite(value, super.displayLS, () {
      super.displayLS = value;
    });
  }

  final _$selectedSupportAtom = Atom(name: 'MapBase.selectedSupport');

  @override
  LightSupport get selectedSupport {
    _$selectedSupportAtom.reportRead();
    return super.selectedSupport;
  }

  @override
  set selectedSupport(LightSupport value) {
    _$selectedSupportAtom.reportWrite(value, super.selectedSupport, () {
      super.selectedSupport = value;
    });
  }

  final _$bindControllerAsyncAction = AsyncAction('MapBase.bindController');

  @override
  Future<Response> bindController(String qr) {
    return _$bindControllerAsyncAction.run(() => super.bindController(qr));
  }

  final _$MapBaseActionController = ActionController(name: 'MapBase');

  @override
  void setDisplayClosets(List<ControlCloset> closets) {
    final _$actionInfo = _$MapBaseActionController.startAction(
        name: 'MapBase.setDisplayClosets');
    try {
      return super.setDisplayClosets(closets);
    } finally {
      _$MapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDisplayLightSupport(List<LightSupport> lightSupports) {
    final _$actionInfo = _$MapBaseActionController.startAction(
        name: 'MapBase.setDisplayLightSupport');
    try {
      return super.setDisplayLightSupport(lightSupports);
    } finally {
      _$MapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectLightSupport(LightSupport ls) {
    final _$actionInfo = _$MapBaseActionController.startAction(
        name: 'MapBase.selectLightSupport');
    try {
      return super.selectLightSupport(ls);
    } finally {
      _$MapBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
streets: ${streets},
displayClosets: ${displayClosets},
displayLS: ${displayLS},
selectedSupport: ${selectedSupport}
    ''';
  }
}
