import 'package:flutter/material.dart';
import 'welcomeScreen.dart';
import 'getStarted.dart';

void main() => runApp(AppName());

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: started(),
    );
  }
}
