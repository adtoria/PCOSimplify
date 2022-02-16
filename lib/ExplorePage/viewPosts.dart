import 'package:flutter/material.dart';

class SeeStories extends StatelessWidget {
  final String title;
  final String name;
  final String body;

  SeeStories({required this.name, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Text(name),
            Text(body),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: (){
        //     Navigator.pop(context);
        // },
        //   child: Icon(Icons.keyboard_return, color: Colors.white,),
        //   backgroundColor: Colors.red,
        //   tooltip: "Go Back",),
      ),
    );
  }
}
