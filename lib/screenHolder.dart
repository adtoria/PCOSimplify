import 'package:flutter/material.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'Health/foodMain.dart';
import 'Home/homePage.dart';
import 'profilePage.dart';
import 'drawer.dart';

class ScreenHolder extends StatefulWidget {
  static const String id = 'screen_holder';
  @override
  _ScreenHolderState createState() => _ScreenHolderState();
}

class _ScreenHolderState extends State<ScreenHolder> {
  int currentIndex = 0;

  final screens = [
    Home(),
    CalendarWidget(),
    FoodMain(),
    ExploreMain()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFF1E233C),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xFF9F86C0),
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 37.0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.home),
            ),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.alarm),
            ),
            label: "Tracker",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.favorite),
            ),
            label: "Health",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.travel_explore),
            ),
            label: "Explore",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
