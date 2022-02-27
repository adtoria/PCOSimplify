import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promject/LoginRegister/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginRegister/forgotPassword.dart';

class OurDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Shivam Harjani';
    final urlImage = 'https://picsum.photos/seed/509/600';

    return Drawer(
      child: Material(
        color: Color(0xFFDDE3FD),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              //     Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => UserPage(
              //     name: 'Sarah Abs',
              //     urlImage: urlImage,
              //   ),
              // )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'People',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Change Password',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Users Page',
                    icon: Icons.add_comment_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Updates',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  Divider(
                    color: Colors.black,
                    thickness: 2.0,
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
                    text: 'Notifications',
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

  Widget buildHeader({
    required String urlImage,
    required String name,
  }) =>
      Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        color: Color(0xFF1E233C),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Lexend Deca',
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

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
      case 4:
        FirebaseAuth.instance.signOut();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
        break;
    }
  }
}
