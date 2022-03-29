import 'package:flutter/material.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Home/homePage.dart';

class WorkoutMain extends StatefulWidget {
  @override
  State<WorkoutMain> createState() => _WorkoutMainState();
}

class _WorkoutMainState extends State<WorkoutMain> {
  _onTap() {
    Navigator.of(context).pushReplacement(
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

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF1E233C),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        FoodMain(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ));
                        },
                        child: Text(
                          'Nutrition',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF9F86C0),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 6),
                        child: Text(
                          'Workout',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
      ),
    );
  }
}
