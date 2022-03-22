import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promject/ExplorePage/addStory.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Tracker/periodEditingPage.dart';
import 'package:promject/drawer.dart';
import 'package:promject/ExplorePage/userClass.dart';
import 'package:promject/ExplorePage/viewStory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'customAlertDialog.dart';
import 'package:url_launcher/url_launcher.dart';

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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(
            'By ' + user.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
          tileColor: Color(0xFFFFD3E1),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeeStories(
                title: user.title,
                name: user.name,
                body: user.body,
              ),
            ),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1E233C),
        centerTitle: true,
        title: Text(
          "PCOSimplify",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            ListTile(
              title: Center(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 13),
                  child: Text(
                    "Polycystic Ovary Syndrome",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              subtitle: Column(
                children: [
                  SizedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder common among women of reproductive age. Women with PCOS may have disturbed menstrual periods or excess androgen (male hormone) levels.",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("Read more..."),
                        onPressed: () => showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                              title: "Polycystic Ovary Syndrome",
                              description:
                                  "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder common among women of reproductive age. Women with PCOS may have disturbed menstrual periods or excess androgen (male hormone) levels. The ovaries may develop numerous small collections of fluid and fail to regularly release eggs.",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6,
              color: Color(0xFFedf1f7),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 27, 0, 0),
                      child: Text(
                        "Tracker Events",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  color: Color(0xFFDDE3FD),
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 0, 10),
                          child: Text(
                            DateFormat("dd").format(
                              DateTime.now(),
                            ),
                            style: TextStyle(
                              color: Color(0xFF1E233C),
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                              child: Text(
                                DateFormat('EEEE')
                                    .format(DateTime.now())
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Text(
                                DateFormat.MMMM().format(DateTime.now()) +
                                    " " +
                                    DateFormat("yyyy").format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 10, 10),
                          child: FloatingActionButton(
                            backgroundColor: Color(0xFF1E233C),
                            child: Icon(
                              Icons.add,
                              size: 35,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventEditingPage(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 1,
              thickness: 6,
              color: Color(0xFFedf1f7),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 27, 0, 10),
                      child: Text(
                        "Explore Articles",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Pregnancy
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://www.healthline.com/health/pregnancy/pcos");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/pregnancy.png'),
                            ),
                          ),
                        ),
                      ),
                      // Diabetes
                      GestureDetector(
                        onTap: () {
                          launch("https://www.youtube.com/watch?v=O_bhGDeOa_k");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/pregnancy.png'),
                            ),
                          ),
                        ),
                      ),
                      // Hirsutism
                      GestureDetector(
                        onTap: () {
                          launch("https://www.womenshairlossproject.com/");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/hirsutism.png'),
                            ),
                          ),
                        ),
                      ),
                      // Periods
                      GestureDetector(
                        onTap: () {
                          launch("https://www.youtube.com/watch?v=MXi7mtC7AAk");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/pregnancy.png'),
                            ),
                          ),
                        ),
                      ),
                      // Workout
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://www.verywellhealth.com/setting-up-your-exercise-routine-2616476");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/workout.png'),
                            ),
                          ),
                        ),
                      ),
                      // Acne
                      GestureDetector(
                        onTap: () {
                          launch("https://www.youtube.com/watch?v=dbY1LflgTl4");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/acne.png'),
                            ),
                          ),
                        ),
                      ),
                      // Gut Health
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://jilliangreaves.com/blog/2020/5/5/the-pcos-gut-health-connection");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/pregnancy.png'),
                            ),
                          ),
                        ),
                      ),
                      // Sleep
                      GestureDetector(
                        onTap: () {
                          launch("https://www.youtube.com/watch?v=2hCMrp11vio");
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/sleepmanagement.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 1,
              thickness: 6,
              color: Color(0xFFedf1f7),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 25, 0, 10),
                      child: Text(
                        "Latest User Story",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
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
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Color(0xFF1E233C),
                              size: 24,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              "Share Your Story",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddPost()),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFF1E233C),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
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
