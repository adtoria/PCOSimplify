import 'package:flutter/material.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
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
    Center(child: Text("A", style: TextStyle(fontSize: 60.0))),
    Center(child: Text("B", style: TextStyle(fontSize: 60.0))),
    Center(child: Text("C", style: TextStyle(fontSize: 60.0))),
    //ProfilePage()
    ExploreMain()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 40.0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Feed",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Explore",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
