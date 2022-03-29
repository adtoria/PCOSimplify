import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'workoutMain.dart';
import 'nutrientList.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Home/homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodMain extends StatefulWidget {
  @override
  _FoodMainState createState() => _FoodMainState();
}

class _FoodMainState extends State<FoodMain> {
  TextEditingController? _controller = TextEditingController();
  List<Items> items = allItems;

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
    FoodMain(),
    ExploreMain()
  ];

  int _currentIndex = 2;

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF1E233C),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 6),
                        child: Text(
                          'Nutrition',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        WorkoutMain(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: Text(
                            'Workout',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF9F86C0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: searchItem,
                ),
              ),
              items.length == 0
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search_off,
                                size: 130,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No results found.',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.25,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                            item.route,
                            SizedBox(
                              height: 25,
                            ),
                            Divider(
                              height: 1,
                              thickness: 6,
                              color: Color(0xFFedf1f7),
                            ),
                          ],
                        );
                      },
                    )
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
      ),
    );
  }

  void searchItem(String query) {
    final suggestions = allItems.where((item) {
      final Title = item.title.toLowerCase();
      final input = query.toLowerCase();

      return Title.contains(input);
    }).toList();

    setState(() {
      items = suggestions;
    });
  }
}
