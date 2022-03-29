import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeStories extends StatelessWidget {
  final String title;
  final String name;
  final String body;

  SeeStories({required this.name, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("$name's Story"),
          backgroundColor: Color(0xFF1E233C),
          foregroundColor: Colors.white,
          elevation: 3.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 5),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E233C),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
                indent: 120,
                endIndent: 120,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 50),
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
