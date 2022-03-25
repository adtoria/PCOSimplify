import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String content;
  Heading({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Text(
                  content,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'RaleWay',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}