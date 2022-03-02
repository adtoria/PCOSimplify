import 'package:flutter/material.dart';
import 'package:promject/Tracker/tasksWidget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'eventDataSource.dart';
import 'eventEditingPage.dart';
import 'eventProvider.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/drawer.dart';
import 'package:promject/Home/homePage.dart';

class CalendarWidget extends StatefulWidget {
  static const String id = "calendar_widget";

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
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

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SafeArea(
      child: Scaffold(
        drawer: OurDrawer(),
        backgroundColor: Colors.white,
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: EventDataSource(events),
          initialSelectedDate: DateTime.now(),
          cellBorderColor: Colors.white,
          todayHighlightColor: Colors.pinkAccent,
          backgroundColor: Colors.white,
          onLongPress: (details) {
            final provider = Provider.of<EventProvider>(context, listen: false);

            provider.setDate(details.date!);
            showModalBottomSheet(
              context: context,
              builder: (context) => TasksWidget(),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Color(0xFF1E233C),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EventEditingPage()),
          ),
        ),
      ),
    );
  }
}
