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
        backgroundColor: Color(0xFFDDE3FD),
        appBar: AppBar(
          title: Text("$name's Story"),
          backgroundColor: Color(0xFFFFD3E1),
          foregroundColor: Colors.black,
          elevation: 3.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                indent: 170,
                endIndent: 170,
                color: Colors.black,
              ),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
