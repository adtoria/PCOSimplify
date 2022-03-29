import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:promject/Home/homePage.dart';
import 'dart:async';

import 'package:promject/LoginRegister/loginPage.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool verify = false;
  Timer? timer;
  bool canResend = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verify = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!verify) {
      sendVerificationEmail();

      timer =
          Timer.periodic(Duration(seconds: 3), (timer) => CheckEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future CheckEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      verify = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (verify) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResend = false);
      await Future.delayed(Duration(seconds: 30));
      setState(() => canResend = true);
    } catch (e) {
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Please verify your email.",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: Duration(seconds: 5),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) => verify
      ? Home()
      : Scaffold(
          appBar: AppBar(
            title: Text("Verify Email"),
            backgroundColor: Color(0xFF1E233C),
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color(0xFF9F86C0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Text(
                      "A verification email has been sent to the entered email.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      primary: Color(0xFF1E233C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: canResend ? sendVerificationEmail : null,
                    child: Text(
                      "Resend Email",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                ),
              ],
            ),
          ),
        );
}
