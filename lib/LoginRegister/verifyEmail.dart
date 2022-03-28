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
  bool isVerified = false;
  Timer? timer;
  bool canResend=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
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
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResend=false);
      await Future.delayed(Duration(seconds: 30));
      setState(() => canResend=true);
    } catch (e) {
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "An error occurred!",
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
  Widget build(BuildContext context) => isVerified
      ? Home()
      : Scaffold(
          appBar: AppBar(
            title: Text("Verify Email"),
          ),
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A verification email has been sent to the given email.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    onPressed: canResend ? sendVerificationEmail : null,
                    icon: Icon(Icons.email,size: 32,),
                    label: Text("Resent Email",style: TextStyle(fontSize: 24),),
                  ),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      onPressed: (){
                        //FirebaseAuth.instance.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text("Cancel",style: TextStyle(fontSize: 24),),
                  ),
                ],
              )),
        );
}
