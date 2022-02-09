import 'package:flutter/material.dart';
import 'explore.dart';

class ExplorerMain extends StatelessWidget {
  const ExplorerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFD7B4F3),
        body: Explorer(height: 108.0),
      ),
    );
  }
}
