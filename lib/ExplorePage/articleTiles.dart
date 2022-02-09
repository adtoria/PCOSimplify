import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tiles extends StatelessWidget {
  Tiles(
      {required this.articleUrl,
      required this.categoryName,
      required this.imageUrl});
  final String articleUrl, categoryName, imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(articleUrl);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 20),
        child: Container(
          //margin: EdgeInsets.only(right: 14),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  height: 130,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 130,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black26),
                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
