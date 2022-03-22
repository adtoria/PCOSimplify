import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promject/LoginRegister/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promject/contactUs.dart';
import 'LoginRegister/forgotPassword.dart';

class OurDrawer extends StatelessWidget {
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

    print(flag);
    print(check);

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
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/seed/509/600'))
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.photoURL!)),
                  SizedBox(width: 20),
                  check == flag
                      ? Text(
                          "skh",
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )
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
                    text: 'ADD',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Contact Us',
                    icon: Icons.email_outlined,
                    onClicked: () => selectedItem(context, 3),
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
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'ADD',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 5),
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
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
            color: color,
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
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PeoplePage(),
        // ));
        break;
      case 1:
        //print("Favourites page");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPassword()));
        break;
      case 3:
      //print("Favourites page");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactUs()));
        break;
      case 4:
        FirebaseAuth.instance.signOut();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
    }
  }
}
