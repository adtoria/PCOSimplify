import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlueArticleTile extends StatelessWidget {
  final String url;
  final String title;

  BlueArticleTile({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
        child: Container(
          width: 125,
          height: 125,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Color(0xFFDDE3FD),
            border: Border.all(
              color: Color(0xFF7C90A0),
              width: 2.5,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
