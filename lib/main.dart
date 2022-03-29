import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:promject/LoginRegister/googleSignIn.dart';
import 'package:promject/Tracker/eventProvider.dart';
import 'package:promject/screenHolder.dart';
import 'package:provider/provider.dart';
import 'Home/homePage.dart';
import 'getStarted.dart';
import 'screenHolder.dart';
import 'profilePage.dart';
import 'LoginRegister/loginPage.dart';
import 'LoginRegister/registrationPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppName());
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        home: Home(),
        //initialRoute: Started.id,
        routes: {
          Started.id: (context) => Started(),
          LoginPage.id: (context) => LoginPage(),
          Register.id: (context) => Register(),
          ProfilePage.id: (context) => ProfilePage(),
          ScreenHolder.id: (context) => ScreenHolder(),
        },
      ),
    );
  }
}
