import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Reset link sent successfully.",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: Duration(seconds: 5),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "An error occured.",
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
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1E233C),
          title: Text("Update Password"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color(0xFF9F86C0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Text(
                      "Enter your email address that you used to register. "
                      "We'll send you an email with a link to reset your password.",
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
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null) {
                        return "* Required";
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      primary: Color(0xFF1E233C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    //icon: Icon(Icons.email_outlined),
                    child: Text(
                      "Send Email",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: resetPassword,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
