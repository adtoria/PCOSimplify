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
          width: 120,
          height: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Color(0xFFDDE3FD),
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
