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
      home: LoginPage(),
    );
  }
}
