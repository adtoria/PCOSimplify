import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promject/LoginRegister/googleSignIn.dart';
import 'package:promject/LoginRegister/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promject/contactUs.dart';
import 'package:promject/privacyPolicy.dart';
import 'package:promject/termsOfService.dart';
import 'package:provider/provider.dart';
import 'LoginRegister/forgotPassword.dart';
import 'inviteFriend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promject/drawerUser.dart';

class OurDrawer extends StatefulWidget {
  @override
  State<OurDrawer> createState() => _OurDrawerState();
}

class _OurDrawerState extends State<OurDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String flag = "";
    Future<String> getAuthType() async {
      String authType = user.providerData[0].providerId;
      flag = authType;
      return authType;
    }

    final String check = "password";
    getAuthType();

    Future<Users?> getData() async{
      String userId = (await FirebaseAuth.instance.currentUser!).uid;
      final docuser = FirebaseFirestore.instance.collection('Name').doc(userId);
      final snapshot = await docuser.get();

      if(snapshot.exists){
        print(Users.fromJson(snapshot.data()!).name);
        return Users.fromJson(snapshot.data()!);
      }
    };

      return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  check == flag
                      ?
                      FutureBuilder<Users?>(
                        future: getData(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            final user=snapshot.data;
                            return Text('${user?.name}',style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),);
                          }
                          else{
                            return Text("Nothing to display");
                          }
                        })
                  // Text(
                  //        "",
                  //         style: TextStyle(
                  //           fontFamily: 'Lexend Deca',
                  //           fontSize: 24,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )
                      : Text(
                          user.displayName!,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                ],
              ),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'ADD',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Update Password',
                    icon: Icons.settings_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Invite a friend',
                    icon: Icons.people_outline_rounded,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Contact Us',
                    icon: Icons.email_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 24),
                  Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    indent: 0,
                    endIndent: 0,
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Privacy policy',
                    icon: Icons.privacy_tip_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Terms of Service',
                    icon: Icons.receipt_long_outlined,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.grey;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    //Navigator.of(context).pop();

    switch (index) {
      case 0:
        print("People page");
        break;
      case 1:
        //print("Favourites page");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPassword()));
        break;
      case 2:
      //print("Favourites page");
        showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (context) {
            return Invite();
          },
        );
        break;
      case 3:
      //print("Favourites page");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactUs()));
        break;
      case 4:
        FirebaseAuth.instance.signOut();
        final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.logout();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
      case 5:
      //print("Favourites page");
        showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (context) {
            return PrivacyPolicy();
          },
        );
        break;
      case 6:
      //print("Favourites page");
        showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (context) {
            return Service();
          },
        );
        break;
    }
  }
}
