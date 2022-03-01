import 'package:flutter/material.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _onTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => _children[_currentIndex],
      ),
    ); // this has changed
  }

  final List<Widget> _children = [
    Home(),
    CalendarWidget(),
    FoodMain(),
    ExploreMain()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF1E233C),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xFF9F86C0),
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 37.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _onTap();
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
              child: Icon(Icons.favorite),
            ),
            label: "Tracker",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.chat),
            ),
            label: "Chat",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Icon(Icons.person),
            ),
            label: "Explore",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
