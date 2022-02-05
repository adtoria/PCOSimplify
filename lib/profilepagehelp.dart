import 'package:flutter/material.dart';

class ProfilePageIcons extends StatelessWidget {
  ProfilePageIcons({required this.lable});

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: MaterialButton(
        onPressed: () {
          print('Button pressed ...');
        },
        minWidth: double.maxFinite,
        height: 50.0,
        //color: Color(0xFF4B39EF),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF262D34),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFF090F13),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lable,
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF95A1AC),
                        size: 20,
                      ),

                      // MaterialButton(
                      //   onPressed: () {
                      //     print('Button pressed ...');
                      //   },
                      //   minWidth: 70.0,
                      //   height: 50.0,
                      //   color: Color(0xFF4B39EF),
                      //   elevation: 2,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      //
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
