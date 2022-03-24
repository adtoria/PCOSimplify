import 'package:flutter/material.dart';

class ViewingPage extends StatelessWidget {
  final String text;
  final String title;

  ViewingPage({required this.title,required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),
      ),
    );
  }
}
