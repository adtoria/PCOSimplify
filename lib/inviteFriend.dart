import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, twitter, email, linkedin, whatsapp }

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Let your friends and family know about PCOSimplify!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            buildSocialButtons(axis: Axis.horizontal),
          ],
        ),
      );
  }

  Widget buildSocialButtons({required Axis axis}) {
    final children = [
      buildSocialButton(
        icon: FontAwesomeIcons.facebookSquare,
        color: Color(0xFF0075fc),
        onClicked: () => share(SocialMedia.facebook),
      ),
      buildSocialButton(
        icon: FontAwesomeIcons.twitter,
        color: Color(0xFF1da1f2),
        onClicked: () => share(SocialMedia.twitter),
      ),
      buildSocialButton(
        icon: Icons.mail,
        color: Colors.black87,
        onClicked: () => share(SocialMedia.email),
      ),
      buildSocialButton(
        icon: FontAwesomeIcons.linkedin,
        color: Color(0xFF0064c9),
        onClicked: () => share(SocialMedia.linkedin),
      ),
      buildSocialButton(
        icon: FontAwesomeIcons.whatsappSquare,
        color: Color(0xFF00d856),
        onClicked: () => share(SocialMedia.whatsapp),
      ),
    ];

    final child = axis == Axis.vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );

    return Card(child: child);
  }

  Widget buildSocialButton({
    required IconData icon,
    Color? color,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        child: kIsWeb
            ? Container(
                width: 96,
                height: 96,
                child: Center(child: FaIcon(icon, color: color, size: 64)),
              )
            : Container(
                width: 64,
                height: 64,
                child: Center(child: FaIcon(icon, color: color, size: 40)),
              ),
        onTap: onClicked,
      );

  Future share(SocialMedia socialPlatform) async {
    final subject = 'Best Flutter Video Ever!';
    final text =
        '. Get it at';
    final urlShare =
        Uri.encodeComponent('https://www.youtube.com/watch?v=bWehAFTFc9o');

    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.email: 'mailto:?subject=$subject&body=$text\n\n$urlShare',
      SocialMedia.linkedin:
          'https://www.linkedin.com/shareArticle?mini=true&url=$urlShare',
      SocialMedia.whatsapp: 'whatsapp://send?text=$text\n\n$urlShare',
    };
    final url = urls[socialPlatform]!;

    // if (await canLaunch(url)) {
    //   print("HI");
      await launch(url);
    // }
    // else{
    //   print("bye");
    // }
  }
}
