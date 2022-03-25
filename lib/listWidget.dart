import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String content;
  ListWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
        child: Row(
          children: [
            Expanded(
              child: Text("   • "),
            ),
            Expanded(
              flex: 12,
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
          ],
        ),
      ),
    );
  }
}
