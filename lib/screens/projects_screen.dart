import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sunrise_map/mobx/projects.dart';
import 'package:sunrise_map/screens/map/map_screen.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ProjectsStore _projectsStore = ProjectsStore();

  @override
  void initState() {
    super.initState();
    _projectsStore.loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Проекты"),
      ),
      body: Observer(
          name: "_projectsStore.projects",
          builder: (context) {
            if (_projectsStore.projects == null) return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: _projectsStore.projects.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return MapScreen(
                          project: _projectsStore.projects[i],
                        );
                      }));
                    },
                    title: Text(_projectsStore.projects[i].name),
                  );
                });
          }),
    );
  }
}
