import 'package:flutter/material.dart';

class ProfilePageIcons extends StatelessWidget {
  ProfilePageIcons({required this.icon,required this.lable});

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(
              color: Color(0xFFEFEFEF),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Icon(
                  icon,
                  color: Color(0xFF4B39EF),
                  size: 24,
                ),
              ),
              Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text(
                  lable,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF95A1AC),
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
