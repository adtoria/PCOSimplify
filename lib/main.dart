import 'package:flutter/material.dart';
import 'package:promject/ExplorePage/explore.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Tracker/eventProvider.dart';
import 'package:promject/screenHolder.dart';
import 'package:provider/provider.dart';
import 'getStarted.dart';
import 'screenHolder.dart';
import 'profilePage.dart';
import 'LoginRegister/loginPage.dart';
import 'LoginRegister/registrationPage.dart';
import 'ExplorePage/exploreMain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ExplorePage/addStory.dart';
import 'ExplorePage/homePosts.dart';
import 'LoginRegister/forgotPassword.dart';
import 'package:promject/Home/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppName());
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
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
