import 'package:flutter/material.dart';
import 'package:promject/screenHolder.dart';
import 'welcomeScreen.dart';
import 'getStarted.dart';
import 'screenHolder.dart';
import 'profilePage.dart';
import 'loginPage.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Started(),
      initialRoute: Started.id,
      routes: {
        Started.id: (context) => Started(),
        LoginPage.id: (context) => LoginPage(),
        ProfilePage.id: (context) => ProfilePage(),
        ScreenHolder.id: (context) => ScreenHolder(),
      },
    );
  }
}
