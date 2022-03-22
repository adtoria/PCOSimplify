import 'package:flutter/material.dart';
import 'package:promject/LoginRegister/loginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Started extends StatefulWidget {
  static const String id = "get_started";

  @override
  _StartedState createState() => _StartedState();
}

class _StartedState extends State<Started> {
  PageController pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: PageView(
                            controller: pageViewController, //??=
                            //PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/Community.png'),
                                  ),
                                  Column(
                                    children: [
                                      Text("BADA BLA BLA BLA"),
                                      Text("Chota bla bla bla")
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/Tracker.png'),
                                  ),
                                  Column(
                                    children: [
                                      Text("BADA BLA BLA BLA"),
                                      Text("Chota bla bla bla")
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/Health.png'),
                                  ),
                                  Column(
                                    children: [
                                      Text("BADA BLA BLA BLA"),
                                      Text("Chota bla bla bla")
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: SmoothPageIndicator(
                              controller: pageViewController, //??=
                              //PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) {
                                pageViewController.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 16,
                                dotColor: Color(0xFF9F86C0),
                                activeDotColor: Color(0xFF1E233C),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  minWidth: 225.0,
                  height: 50.0,
                  color: Color(0xFF1E233C),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
