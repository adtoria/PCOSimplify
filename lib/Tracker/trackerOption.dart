import 'package:flutter/material.dart';
import 'package:promject/Tracker/appointmentEditingPage.dart';
import 'package:promject/Tracker/medicineEditingPage.dart';
import 'package:promject/Tracker/periodEditingPage.dart';

class TrackerOption extends StatefulWidget {
  const TrackerOption({Key? key}) : super(key: key);

  @override
  State<TrackerOption> createState() => _TrackerOptionState();
}

class _TrackerOptionState extends State<TrackerOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose"),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text("Period"),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PeriodEventEditingPage()));
              },
          ),

          TextButton(
            child: Text("Medicine"),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MedicineEventEditingPage()));
              },
          ),

          TextButton(
            child: Text("Appointment"),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AppointmentEventEditingPage()));
              },
          ),
        ],
      )
    );
  }
}
