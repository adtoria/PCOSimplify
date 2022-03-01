import 'package:flutter/material.dart';
import 'package:promject/Tracker/tasksWidget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'eventDataSource.dart';
import 'eventEditingPage.dart';
import 'eventProvider.dart';

class CalendarWidget extends StatefulWidget {
  static const String id = "calendar_widget";

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    //final events = Provider.of<EventProvider>(context).events;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SfCalendar(
          view: CalendarView.month,
          //dataSource: EventDataSource(events),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EventEditingPage()),
          ),
        ),
      ),
    );
  }
}
