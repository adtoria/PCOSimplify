import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String content;
  SubHeading({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'RaleWay',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}