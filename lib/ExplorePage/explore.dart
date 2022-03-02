import 'package:flutter/material.dart';
import 'leftArticleTile.dart';
import 'userClass.dart';
import 'addStory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'viewStory.dart';
import 'rightArticleTile.dart';

class Explorer extends StatefulWidget implements PreferredSizeWidget {
  Explorer({required this.height});
  final double height;

  @override
  State<Explorer> createState() => _ExplorerState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(height);
}

class _ExplorerState extends State<Explorer> {
  PageController pageViewController = PageController();

  Stream<List<User>> readData() => FirebaseFirestore.instance
      .collection('users')
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
    return PageView(
      controller: pageViewController,
      children: [
        //Page 0
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: _exploreOptionList(context),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E233C),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      //child: Center(
                      child: Text(
                        "Add your story",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      //),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPost())),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                  ),
                ),
              ),
              StreamBuilder<List<User>>(
                stream: readData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong!');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;

                    return Column(
                      children: users.map(buildUser).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),

        //Page 1
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LeftTiles(
                            height: 100,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName: "Pregnancy",
                            source: "Youtube",
                          ),
                          LeftTiles(
                            height: 200,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName:
                                "Pregnancy fkbsdkfjbdsjbf fjdsbkjfbdjlsfb fdslbgldlgkn ",
                            source: "Youtube",
                          ),
                          LeftTiles(
                            height: 300,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName:
                                "Pregnancy fkbsdkfjbdsjbf fjdsbkjfbdjlsfb fdslbgldlgkn ",
                            source: "Youtube",
                          ),
                          LeftTiles(
                            height: 150,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName: "Pregnancy fkb",
                            source: "Youtube",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RightTiles(
                            height: 350,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName: "Pregnancy",
                            source: "Youtube",
                          ),
                          RightTiles(
                            height: 480,
                            articleUrl:
                                'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                            categoryName:
                                "Pregnancy fkbsdkfjbdsjbf fjdsbkjfbdjlsfb fdslbgldlgkn ",
                            source: "Youtube",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 2
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 3
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 4
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 5
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LeftTiles(
                            height: 197,
                            articleUrl:
                                'https://www.healthstatus.com/health_blog/pcos/7-ways-to-lower-stress-with-pcos/',
                            categoryName: "7 Ways To Lower Stress With PCOS",
                            source: "healthstatus.com",
                          ),
                          LeftTiles(
                            height: 250,
                            articleUrl:
                                'https://www.youtube.com/watch?v=G_VE2OZrgNg',
                            categoryName:
                                "Stress in PCOS and its Effects on Fertility Potential",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            height: 245,
                            articleUrl:
                                'https://www.youtube.com/watch?v=j_zWoGEqLbc',
                            categoryName:
                                "Mental health with Clinical Psychologist Ms. Seema Hingorrany",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RightTiles(
                            height: 175,
                            articleUrl:
                                'https://madeleineshaw.com/stress-and-pcos/',
                            categoryName: "Stress and PCOS",
                            source: "madeleineshaw.com",
                          ),
                          RightTiles(
                            height: 165,
                            articleUrl:
                                'https://www.youtube.com/watch?v=G87wihFwYXc',
                            categoryName: "PCOS and Cortisol",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            height: 180,
                            articleUrl:
                                'https://www.healthline.com/health/depression/pcos-and-depression#Does-PCOS-cause-depression?',
                            categoryName: "PCOS and Depression",
                            source: "Healthline.com",
                          ),
                          RightTiles(
                            height: 190,
                            articleUrl:
                                'https://www.youtube.com/watch?v=hJbRpHZr_d0',
                            categoryName: "Yoga for Anxiety and Stress",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 6
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 7
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 8
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 9
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 10
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                    child: _exploreOptionList(context),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Page 11
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            height: 197,
                            articleUrl:
                                'https://www.rmact.com/fertility-blog/pcos-fitness-guide',
                            categoryName:
                                "Best Workout for Managing PCOS Symptoms",
                            source: "rmact.com",
                          ),
                          LeftTiles(
                            height: 200,
                            articleUrl:
                                'https://www.youtube.com/watch?v=4xrDxxg5jv4',
                            categoryName:
                                "5 Best Yoga Poses for PCOS Treatment",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            height: 190,
                            articleUrl:
                                'https://www.healthline.com/health/womens-health/exercise-for-pcos',
                            categoryName: "Best Exercises for PCOS",
                            source: "healthline.com",
                          ),
                          LeftTiles(
                            height: 190,
                            articleUrl:
                                'https://www.youtube.com/watch?v=hNkqaMw8YCc',
                            categoryName: "Yoga for PCOS with Rashmi Ramesh",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RightTiles(
                            height: 225,
                            articleUrl:
                                'https://www.verywellhealth.com/setting-up-your-exercise-routine-2616476',
                            categoryName:
                                "Benefits of Exercising When You Have PCOS",
                            source: "verywellhealth.com",
                          ),
                          RightTiles(
                            height: 180,
                            articleUrl:
                                'https://www.wellcurve.in/blog/yoga-poses-asanas-for-pcos/',
                            categoryName: "10 Yoga Poses for PCOS",
                            source: "wellcurve.in",
                          ),
                          RightTiles(
                            height: 205,
                            articleUrl:
                                'https://www.youtube.com/watch?v=Tkc2PP37c3U',
                            categoryName: "PCOS Workout with Sheba Devaraj",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _exploreOptionList(BuildContext context) {
    return Container(
      height: 48.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          _exploreTiles(
            title: 'Your Stories',
            context: context,
            index: 0,
          ),
          _exploreTiles(
            title: 'Pain',
            context: context,
            index: 1,
          ),
          _exploreTiles(
            title: 'Pregnancy',
            context: context,
            index: 2,
          ),
          _exploreTiles(
            title: 'Acne/Haircare',
            context: context,
            index: 3,
          ),
          _exploreTiles(
            title: 'Gut Health',
            context: context,
            index: 4,
          ),
          _exploreTiles(
            title: 'Stress Management',
            context: context,
            index: 5,
          ),
          _exploreTiles(
            title: 'Sleep Management',
            context: context,
            index: 6,
          ),
          _exploreTiles(
            title: 'Periods',
            context: context,
            index: 7,
          ),
          _exploreTiles(
            title: 'Hirsutism',
            context: context,
            index: 8,
          ),
          _exploreTiles(
            title: 'Transgender',
            context: context,
            index: 9,
          ),
          _exploreTiles(
            title: 'Diabetes',
            context: context,
            index: 10,
          ),
          _exploreTiles(
            title: 'Workout',
            context: context,
            index: 11,
          ),
        ],
      ),
    );
  }

  Widget _exploreTiles({
    required int index,
    required String title,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.5, 0, 2.5, 0),
      child: GestureDetector(
        onTap: () {
          pageViewController.animateToPage(index,
              duration: Duration(milliseconds: 10), curve: Curves.linear);
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(right: 5),
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 38,
            decoration: BoxDecoration(
              color: Color(0xFF1E233C),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 3, 8, 3),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
