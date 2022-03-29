import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Home/homePage.dart';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previousDistance = 0.0;
  double distance = 0.0;

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
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
                              pageBuilder: (context, animation1, animation2) =>
                                  FoodMain(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
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
                          'Pedometer',
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
        body: StreamBuilder<AccelerometerEvent>(
          stream: SensorsPlatform.instance.accelerometerEvents,
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              x = snapshort.data!.x;
              y = snapshort.data!.y;
              z = snapshort.data!.z;
              distance = getValue(x, y, z);
              if (distance > 6) {
                steps++;
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodMain()),
                            );
                          },
                          color: Color(0xFF1E233C),
                          icon: Icon(
                            Icons.self_improvement,
                            size: 35,
                          ),
                          highlightColor: Color(0xFFDDE3FD),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                        child: Text(
                          "Steps: " + steps.toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: Color(0xFF1E233C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 50,
                      margin: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                      shadowColor: Color(0xFFDDE3FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                        child: Text(
                          "Calories: " + calculateCalories(steps).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: Color(0xFF1E233C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 50,
                      margin: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                      shadowColor: Color(0xFFDDE3FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                        child: Text(
                          "Kilometres: " + calculateMiles(steps).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: Color(0xFF1E233C),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 50,
                      margin: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                      shadowColor: Color(0xFFDDE3FD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
