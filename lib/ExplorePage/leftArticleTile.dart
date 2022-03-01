import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftTiles extends StatelessWidget {
  LeftTiles(
      {required this.articleUrl,
      required this.categoryName,
      required this.source,
      required this.height});
  final String articleUrl, categoryName, source;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(14, 7, 7, 7),
      child: SizedBox(
        height: height,
        child: ListTile(
          tileColor: Color(0xFFFFD3E1),
          title: Text(
            categoryName,
            style: TextStyle(
                color: Color(0xFF1E233C),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Source: $source",
            style: TextStyle(
                color: Color(0xFF1E233C),
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
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
      ),
    );
  }
}
