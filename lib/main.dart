import 'package:flutter/material.dart';
import 'package:sunrise_map/resources/auth_token_storage.dart';
import 'package:sunrise_map/screens/login_screen.dart';
import 'package:sunrise_map/screens/projects_screen.dart';

import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: SRColors.dark,
          accentColor: SRColors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: SRColors.yellow,
          brightness: Brightness.dark),
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatelessWidget {
  AuthTokenStorage tokenStorage = AuthTokenStorage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tokenStorage.getAuthToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return Container();
        if (snapshot.data == null) return LoginScreen();
        return ProjectsScreen();
      },
    );
  }
}
