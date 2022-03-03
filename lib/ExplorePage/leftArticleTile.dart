import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftTiles extends StatelessWidget {
  LeftTiles(
      {required this.articleUrl,
      required this.categoryName,
      required this.source});
  final String articleUrl, categoryName, source;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(14, 7, 7, 7),
      child: ListTile(
        tileColor: Color(0xFFFFD3E1),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
          child: Text(
            categoryName,
            style: TextStyle(
                color: Color(0xFF1E233C),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: Text(
            "Source: $source",
            style: TextStyle(
                color: Color(0xFF1E233C),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
        contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Color(0xFF595B82),
              width: 4,
            )),
        onTap: () {
          launch(articleUrl);
        },
      ),
    );
  }
}
