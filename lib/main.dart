import 'package:flutter/material.dart';
import 'package:promject/ExplorerPage/explore_main.dart';
import 'package:promject/screenHolder.dart';
import 'getStarted.dart';
import 'screenHolder.dart';
import 'profilePage.dart';
import 'Login_Register/loginPage.dart';
import 'Login_Register/registrationPage.dart';
import 'ExplorerPage/explore_main.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExplorerMain(),
      //initialRoute: Started.id,
      routes: {
        Started.id: (context) => Started(),
        LoginPage.id: (context) => LoginPage(),
        Register.id: (context) => Register(),
        ProfilePage.id: (context) => ProfilePage(),
        ScreenHolder.id: (context) => ScreenHolder(),
      },
    );
  }
}
