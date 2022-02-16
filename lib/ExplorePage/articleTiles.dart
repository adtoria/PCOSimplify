import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tiles extends StatelessWidget {
  Tiles(
      {required this.articleUrl,
      required this.categoryName,
      required this.source});
  final String articleUrl, categoryName,source;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(0xFFA6C1EE),
      title: Text(
        categoryName,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Source: $source",
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.black,
            width: 4.5,
          )),
      onTap: (){
        launch(articleUrl);
      },
    );
  }
}
