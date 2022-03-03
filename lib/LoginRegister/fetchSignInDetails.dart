import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    Future<String> getAuthType() async {
      String authType = user.providerData[0].providerId;
      print("hi" + authType + "hi");
      print("hi");
      return authType;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        centerTitle: true,
      ),
      body: TextButton(
        child: Text('Logout'),
        onPressed: () {
          getAuthType();
        },
      ),
    );
  }
}
