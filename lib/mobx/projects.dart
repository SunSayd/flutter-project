import 'package:mobx/mobx.dart';
import 'package:sunrise_map/models/projects.dart';
import 'package:sunrise_map/resources/sr_resource.dart';

part 'projects.g.dart';

class ProjectsStore = ProjectsBase with _$ProjectsStore;

abstract class ProjectsBase with Store {
  final SRResource _resource = SRResource();

  @observable
  List<Project> _projects;

  @computed
  List<Project> get projects => _projects;

  @action
  Future loadProjects() async {
    var projects = await _resource.getProjects();
    this._projects = projects;
  }
}
