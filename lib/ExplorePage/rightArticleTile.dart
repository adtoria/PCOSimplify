import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RightTiles extends StatelessWidget {
  RightTiles(
      {required this.articleUrl,
      required this.categoryName,
      required this.source});
  final String articleUrl, categoryName, source;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(7, 7, 14, 7),
      child: ListTile(
        tileColor: Color(0xFFFFD3E1),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
          child: Text(
            categoryName,
            style: TextStyle(
              color: Color(0xFF1E233C),
              fontSize: 15.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: Text(
            "Source: $source",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Color(0xFF595B82),
            width: 0.5,
          ),
        ),
        onTap: () {
          launch(articleUrl);
        },
      ),
    );
  }
}
