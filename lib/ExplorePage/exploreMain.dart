import 'package:flutter/material.dart';
import 'explore.dart';

class ExploreMain extends StatelessWidget {
  const ExploreMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDDE3FD),
        body: Explorer(height: 108.0),
      ),
    );
  }
}
