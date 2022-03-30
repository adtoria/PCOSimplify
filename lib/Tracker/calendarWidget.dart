import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promject/Health/workoutMain.dart';
import 'package:promject/Tracker/appointmentEditingPage.dart';
import 'package:promject/Tracker/medicineEditingPage.dart';
import 'package:promject/Tracker/tasksWidget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'eventDataSource.dart';
import 'periodEditingPage.dart';
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => _children[_currentIndex],
      ),
    ); // this has changed
  }

  final List<Widget> _children = [
    Home(),
    CalendarWidget(),
    WorkoutMain(),
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
          onTap: (details) {
            final provider = Provider.of<EventProvider>(
              context,
              listen: false,
            );

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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          buttonSize: Size(70, 70),
          childrenButtonSize: Size(55, 55),
          spaceBetweenChildren: 10,
          backgroundColor: Color(0xFF1E233C),
          elevation: 10,
          overlayOpacity: 0.9,
          children: [
            SpeedDialChild(
              child: Icon(
                FontAwesomeIcons.pills,
                size: 20,
                color: Colors.lightBlue,
              ),
              label: "Medicines",
              labelStyle: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              labelBackgroundColor: Color(0xFFedf1f7),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MedicineEventEditingPage()),
              ),
            ),
            SpeedDialChild(
              child: Icon(
                Icons.water_drop,
                size: 20,
                color: Colors.red,
              ),
              label: "Menstrual Cycle",
              labelStyle: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              labelBackgroundColor: Color(0xFFedf1f7),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => PeriodEventEditingPage()),
              ),
            ),
            SpeedDialChild(
              child: Icon(
                FontAwesomeIcons.briefcaseMedical,
                size: 20,
                color: Colors.green,
              ),
              label: "Doctor Appointments",
              labelStyle: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              labelBackgroundColor: Color(0xFFedf1f7),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => AppointmentEventEditingPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
