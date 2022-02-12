import 'package:flutter/material.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/screenHolder.dart';
import 'getStarted.dart';
import 'screenHolder.dart';
import 'profilePage.dart';
import 'LoginRegister/loginPage.dart';
import 'LoginRegister/registrationPage.dart';
import 'ExplorePage/exploreMain.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ExploreMain(),
      home: LoginPage(),
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
