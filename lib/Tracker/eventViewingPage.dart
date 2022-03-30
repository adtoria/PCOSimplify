import 'package:google_fonts/google_fonts.dart';
import 'package:promject/Tracker/appointmentEditingPage.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Tracker/medicineEditingPage.dart';
import 'event.dart';
import 'periodEditingPage.dart';
import 'eventProvider.dart';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1E233C),
          foregroundColor: Colors.white,
          leading: CloseButton(),
          actions: buildViewingActions(context, event),
        ),
        body: ListView(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          children: <Widget>[
            SizedBox(height: 32),
            Text(
              event.title,
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            buildDateTime(event),
            const SizedBox(height: 32),
            Text(
              event.description,
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    final styleTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    final styleDate = TextStyle(
      fontSize: 18,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: styleTitle,
            ),
          ),
          Text(
            Utils.toDateTime(date),
            style: styleDate,
          ),
        ],
      ),
    );
  }

  List<Widget> buildViewingActions(BuildContext context, Event event) => [
        IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (event.backgroundColor == Colors.red) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PeriodEventEditingPage(event: event),
                  ),
                );
              } else if (event.backgroundColor == Colors.lightBlue) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        MedicineEventEditingPage(event: event),
                  ),
                );
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        AppointmentEventEditingPage(event: event),
                  ),
                );
              }
            }),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider = Provider.of<EventProvider>(context, listen: false);

            provider.deleteEvent(event);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => CalendarWidget(),
              ),
            );
          },
        ),
      ];
}
