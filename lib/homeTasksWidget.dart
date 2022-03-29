import 'package:flutter/cupertino.dart';

import 'Tracker/eventDataSource.dart';
import 'Tracker/eventViewingPage.dart';
import 'Tracker/eventProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HomeTasksWidget extends StatefulWidget {
  @override
  _HomeTasksWidgetState createState() => _HomeTasksWidgetState();
}

class _HomeTasksWidgetState extends State<HomeTasksWidget> {
  CalendarController _calendarController = CalendarController();

  @override
  initState() {
    _calendarController.displayDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      return Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 10),
              child: Text(
                'Nothing to track today.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    return SfCalendarTheme(
      data: SfCalendarThemeData(
        timeTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      child: SfCalendar(
        view: CalendarView.week,
        controller: _calendarController,
        monthViewSettings: MonthViewSettings(showAgenda: true),
        timeSlotViewSettings: TimeSlotViewSettings(
          timeInterval: Duration(hours: 2),
          timeTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 13.5,
          ),
        ),
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: Colors.black,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        onTap: (details) {
          if (details.appointments == null) return;

          final event = details.appointments!.first;

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => EventViewingPage(event: event),
            ),
                (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: event.backgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
