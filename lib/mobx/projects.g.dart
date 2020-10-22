// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsStore on ProjectsBase, Store {
  Computed<List<Project>> _$projectsComputed;

  @override
  List<Project> get projects =>
      (_$projectsComputed ??= Computed<List<Project>>(() => super.projects,
              name: 'ProjectsBase.projects'))
          .value;

  final _$_projectsAtom = Atom(name: 'ProjectsBase._projects');

  @override
  List<Project> get _projects {
    _$_projectsAtom.reportRead();
    return super._projects;
  }

  @override
  set _projects(List<Project> value) {
    _$_projectsAtom.reportWrite(value, super._projects, () {
      super._projects = value;
    });
  }

  final _$loadProjectsAsyncAction = AsyncAction('ProjectsBase.loadProjects');

  @override
  Future<dynamic> loadProjects() {
    return _$loadProjectsAsyncAction.run(() => super.loadProjects());
  }

  @override
  String toString() {
    return '''
projects: ${projects}
    ''';
  }
}
