import 'package:promject/Tracker/calendarWidget.dart';

import 'periodEvent.dart';
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
          leading: CloseButton(),
          actions: buildViewingActions(context, event),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            buildDateTime(event),
            SizedBox(height: 32),
            Text(
              event.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              event.description,
              style: TextStyle(color: Colors.white, fontSize: 18),
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
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => EventEditingPage(event: event),
            ),
          ),
        ),
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
