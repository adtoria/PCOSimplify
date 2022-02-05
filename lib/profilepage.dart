import 'package:flutter/material.dart';
import 'profilepagehelp.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         child: Container(
           width: double.maxFinite,
           height: double.maxFinite,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Color(0xFFFBC8D1), Color(0xFF7D5847)],
               stops: [0, 1],
               begin: AlignmentDirectional(1, -1),
               end: AlignmentDirectional(-1, 1),
             ),
           ),
           child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ProfilePageIcons(icon: Icons.subtitles_rounded, lable: "Order History"),
                ProfilePageIcons(icon: Icons.settings_rounded, lable: "My Settings"),
                ProfilePageIcons(icon: Icons.settings_rounded, lable: 'My Notifications'),
                ProfilePageIcons(icon: Icons.text_snippet, lable: 'Terms of Service'),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        child: Text("Log Out",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        minWidth: 90,
                        height: 40,
                        color: Color(0xFF4B39EF),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),

                      ),
                    ],
                  ),
                )


              ],
            ),
           ),
         ),
      ),
    );
  }
}

