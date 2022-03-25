import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String content;
  Content({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 7, 20, 7),
            child: Text(
              content,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15,
                fontFamily: 'RaleWay',
                fontWeight: FontWeight.normal,
                letterSpacing: 0.75,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
