import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sunrise_map/colors.dart';
import 'package:sunrise_map/mobx/login.dart';
import 'package:sunrise_map/screens/projects_screen.dart';
import 'package:sunrise_map/text_styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SRColors.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png"),
          Container(
            width: 300,
            child: TextField(
              autofocus: true,
              onChanged: (v) {
                _loginStore.login = v;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "Логин"),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              obscureText: true,
              onChanged: (v) {
                _loginStore.password = v;
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(hintText: "Пароль"),
            ),
          ),
          Observer(
            builder: (_) {
              if (_loginStore.errorMessage != null)
                return Text(
                  _loginStore.errorMessage,
                  style: ErrorMessageStyle(),
                );
              return Container();
            },
          ),
          Observer(
            builder: (_) {
              if (_loginStore.loading) return CircularProgressIndicator();

              return RaisedButton(
                child: Text("Войти"),
                onPressed: () async {
                  var res = await _loginStore.signIn();
                  if (res) {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return ProjectsScreen();
                    }));
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
