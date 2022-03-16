import 'package:flutter/material.dart';
import 'package:promject/LoginRegister/fetchSignInDetails.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/drawer.dart';
import 'package:promject/ExplorePage/userClass.dart';
import 'package:promject/ExplorePage/viewStory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  int _currentIndex = 0;

  Stream<List<User>> readData() => FirebaseFirestore.instance
      .collection('stories')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 7, 12, 7),
        child: ListTile(
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
            child: Text(
              user.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
            'Written by - ' + user.name,
            style: TextStyle(fontSize: 15),
          ),
          tileColor: Color(0xFFDDE3FD),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeeStories(
                        title: user.title,
                        name: user.name,
                        body: user.body,
                      ))),
          contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Color(0xFF595B82),
                width: 3.0,
              )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1E233C),
        title: Text("Home"),
      ),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.deepOrange,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                          color: Colors.blue,
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                  child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Text('What is PCOS??'),
                                //Content
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Show dialog'),
          ),
          StreamBuilder<List<User>>(
            stream: readData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong!');
              } else if (snapshot.hasData) {
                final users = snapshot.data!;

                return Container(
                  child: users.map(buildUser).elementAt(0),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
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
    );
  }
}
