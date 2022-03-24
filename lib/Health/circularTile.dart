import 'package:flutter/material.dart';
import 'package:promject/Health/viewingPage.dart';

class ArticleTile extends StatelessWidget {
  final String text;
  final String title;

  ArticleTile({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewingPage(title: title, text: text),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
        child: Container(
          width: 120,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF1E233C),
              width: 1,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
