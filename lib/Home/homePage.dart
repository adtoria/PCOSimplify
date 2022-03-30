import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:promject/ExplorePage/addStory.dart';
import 'package:promject/Tracker/calendarWidget.dart';
import 'package:promject/Health/foodMain.dart';
import 'package:promject/ExplorePage/exploreMain.dart';
import 'package:promject/Tracker/periodEditingPage.dart';
import 'package:promject/Tracker/tasksWidget.dart';
import 'package:promject/drawer.dart';
import 'package:promject/ExplorePage/userClass.dart';
import 'package:promject/ExplorePage/viewStory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Health/workoutMain.dart';
import '../Tracker/appointmentEditingPage.dart';
import '../Tracker/medicineEditingPage.dart';
import '../homeTasksWidget.dart';
import 'customAlertDialog.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _onTap() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => _children[_currentIndex],
      ),
    ); // this has changed
  }

  PageController pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    Home(),
    CalendarWidget(),
    WorkoutMain(),
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
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Color(0xFF1E233C),
              width: 1.0,
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
          style: GoogleFonts.montserrat(
            fontSize: 25,
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
                          "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder common among people of reproductive age. People with PCOS often experience disturbed menstrual cycles or excess androgen (male hormone) levels. Not only women but transgender people also experience this condition.",
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("Read more.."),
                        onPressed: () => showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                              title: "Polycystic Ovary Syndrome",
                              description:
                                  "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder common among people of reproductive age. People with PCOS often experience disturbed menstrual cycles or excess androgen (male hormone) levels. Not only women but transgender people also experience this condition. The ovaries may develop numerous small collections of fluid and fail to regularly release eggs.",
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
                          child: SpeedDial(
                            animatedIcon: AnimatedIcons.add_event,
                            buttonSize: Size(60, 60),
                            childrenButtonSize: Size(55, 55),
                            spaceBetweenChildren: 10,
                            backgroundColor: Color(0xFF1E233C),
                            elevation: 10,
                            overlayOpacity: 0.9,
                            children: [
                              SpeedDialChild(
                                child: Icon(
                                  FontAwesomeIcons.pills,
                                  size: 20,
                                  color: Colors.lightBlue,
                                ),
                                label: "Medicines",
                                labelStyle: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                labelBackgroundColor: Color(0xFFedf1f7),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MedicineEventEditingPage()),
                                ),
                              ),
                              SpeedDialChild(
                                child: Icon(
                                  Icons.water_drop,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                label: "Menstrual Cycle",
                                labelStyle: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                labelBackgroundColor: Color(0xFFedf1f7),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => PeriodEventEditingPage()),
                                ),
                              ),
                              SpeedDialChild(
                                child: Icon(
                                  FontAwesomeIcons.briefcaseMedical,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                label: "Doctor Appointments",
                                labelStyle: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                labelBackgroundColor: Color(0xFFedf1f7),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => AppointmentEventEditingPage()),
                                ),
                              ),
                            ],
                          ),
                          // child: FloatingActionButton(
                          //   backgroundColor: Color(0xFF1E233C),
                          //   child: Icon(
                          //     Icons.add,
                          //     size: 35,
                          //   ),
                          //   onPressed: () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PeriodEventEditingPage(),
                          //     ),
                          //   ),
                          // ),
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
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: HomeTasksWidget(),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 6,
              color: Color(0xFFedf1f7),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFD4F4F6)),
                elevation: MaterialStateProperty.all(10.0),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              ),
              onPressed: () => showDialog(
                barrierColor: Colors.black26,
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: PageView(
                            controller: pageViewController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Heading(content: "Overview"),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/period.png'),
                                        ),
                                        Content(
                                            content:
                                                "Polycystic Ovary Syndrome (PCOS) is a hormonal disorder causing enlarged ovaries with small cysts on the outer edges."),
                                        Content(
                                            content:
                                                "The cause of polycystic ovary syndrome isn\'t well understood, but may involve a combination of genetic and environmental factors."),
                                        Content(
                                            content:
                                                "Symptoms include menstrual irregularity, excess hair growth, acne and obesity."),
                                        Content(
                                            content:
                                                "Treatments include birth control pills to regularise periods, medication called metformin to prevent diabetes, statins to control high cholesterol, hormones to increase fertility and procedures to remove excess hair."),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Heading(content: "Symptoms"),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/hirsutism.png'),
                                        ),
                                        SubHeading(
                                            content: "Menstrual Symptoms"),
                                        ListWidget(
                                            content: "Abnormal menstruation"),
                                        ListWidget(
                                            content: "Absence of menstruation"),
                                        ListWidget(
                                            content: "Heavy menstruation"),
                                        ListWidget(
                                            content: "Irregular menstruation"),
                                        ListWidget(
                                            content:
                                                "Short and light menstruation"),
                                        ListWidget(content: "Spotting"),
                                        SubHeading(content: "Weight"),
                                        ListWidget(content: "Obesity"),
                                        ListWidget(content: "Weight gain"),
                                        ListWidget(
                                            content: "Weight fluctuation"),
                                        SubHeading(
                                            content:
                                                "Other very common symptoms"),
                                        ListWidget(content: "Infertility"),
                                        ListWidget(content: "Depression"),
                                        ListWidget(
                                            content: "Loss of scalp hair"),
                                        SubHeading(
                                            content: "Lesser common symptoms"),
                                        ListWidget(content: "Acne"),
                                        ListWidget(content: "Hirsutism"),
                                        ListWidget(content: "Oily skin"),
                                        SizedBox(height: 40),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Heading(content: "Diagnosis"),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/diabetes.png'),
                                    ),
                                    SubHeading(
                                        content:
                                            "Requires a Medical Diagnosis"),
                                    SizedBox(height: 20),
                                    ListWidget(
                                        content:
                                            "Consult an Obstetrician-Gynecologist (OB-GYN)"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        onPressed: () {
                                          launch(
                                              "https://www.google.com/search?sxsrf=APq-WBso8tfi1EFpkS73mX0QTofhAViMhg:1648105464671&q=obgyn+doctor+near+me&sa=X&sqi=2&pjf=1&ved=2ahUKEwisiP-ll972AhX_DkQIHUIyChgQ0EB6BAgAEAQ&biw=1280&bih=605&dpr=1.5");
                                        },
                                        child: Text(
                                          "Find OB-GYNs near you",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF1E233C)),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(5.0),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.all(14)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ListWidget(
                                        content: "Consult an Endocrinologist"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        onPressed: () {
                                          launch(
                                              "https://www.google.com/search?q=endocrinologist+near+me&oq=endocrinologist+near+me&aqs=chrome..69i57.4506j0j1&sourceid=chrome&ie=UTF-8");
                                        },
                                        child: Text(
                                          "Find Endocrinologists near you",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF1E233C)),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(5.0),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.all(14)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Heading(content: "Treatment"),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/Health.png'),
                                        ),
                                        Content(
                                            content:
                                                "Treatment and change in lifestyle can regulate the symptoms but PCOS is not completely curable."),
                                        SubHeading(
                                            content: "Hormonal treatment"),
                                        ListWidget(
                                            content: "Physical exercise"),
                                        ListWidget(
                                            content:
                                                "Birth control pills for regular periods"),
                                        ListWidget(
                                            content:
                                                "Metformin to prevent diabetes"),
                                        ListWidget(
                                            content:
                                                "Hormones to increase fertility"),
                                        SubHeading(content: "Self-care"),
                                        ListWidget(
                                            content: "Physical exercise"),
                                        ListWidget(content: "Weight loss"),
                                        ListWidget(content: "Yoga"),
                                        ListWidget(
                                            content:
                                                "Electrolysis to remove unwanted hair"),
                                        SubHeading(content: "Medications"),
                                        ListWidget(
                                            content:
                                                "Anti-diabetic medication"),
                                        ListWidget(
                                            content:
                                                "Statin to control cholesterol"),
                                        ListWidget(
                                            content: "Hair growth inhibitor"),
                                        SizedBox(height: 50),
                                      ],
                                    )
                                  ],
                                ),
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
                              controller: pageViewController,
                              count: 4,
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
                                dotColor: Color(0xFFDDE3FD),
                                activeDotColor: Color(0xFF3F51B5),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              child: Text(
                "Information about PCOS",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 29,
            ),
            Divider(
              height: 1,
              thickness: 6,
              color: Color(0xFFedf1f7),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 27, 0, 10),
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
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 27, 15, 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExploreMain(),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppedpregnancy.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppeddiabetes.png'),
                            ),
                          ),
                        ),
                      ),
                      // Hairfall
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppedhairfall.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image:
                                  AssetImage('assets/images/croppedperiod.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppedworkout.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image:
                                  AssetImage('assets/images/croppedacne.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppedguthealth.png'),
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
                              border: Border.all(
                                color: Color(0xFF1E233C),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/croppedsleepmanagement.png'),
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
                    Card(
                      child: StreamBuilder<List<User>>(
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
                      color: Colors.transparent,
                      elevation: 15,
                      shadowColor: Color(0xFFedf1f7),
                    ),
                    SizedBox(
                      height: 20,
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
                        elevation: MaterialStateProperty.all(10.0),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                      ),
                    ),
                  ],
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

class Heading extends StatelessWidget {
  final String content;
  Heading({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Text(
                  content,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'RaleWay',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubHeading extends StatelessWidget {
  final String content;
  SubHeading({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
            child: Text(
              content,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'RaleWay',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final String content;
  Content({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 7, 20, 7),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.none,
          fontSize: 15,
          fontFamily: 'RaleWay',
          fontWeight: FontWeight.normal,
          letterSpacing: 0.75,
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final String content;
  ListWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
        child: Row(
          children: [
            Expanded(
              child: Text("   • "),
            ),
            Expanded(
              flex: 12,
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontFamily: 'RaleWay',
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
