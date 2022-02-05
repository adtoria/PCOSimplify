import 'package:flutter/material.dart';
import 'package:promject/screenholder.dart';
import 'welcomeScreen.dart';
import 'getStarted.dart';
import 'screenholder.dart';
import 'profilepage.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screenholder(),
    );
  }
}
