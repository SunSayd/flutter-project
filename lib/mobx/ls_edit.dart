import 'package:mobx/mobx.dart';
import 'package:sunrise_map/models/light_support.dart';

part 'ls_edit.g.dart';

class LSEditStore = LSEditBase with _$LSEditStore;

abstract class LSEditBase with Store {
  LightSupport lightSupport;

  LSEditBase(this.lightSupport);

  @action
  void saveChanges() {}
}
