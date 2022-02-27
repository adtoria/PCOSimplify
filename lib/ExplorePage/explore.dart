import 'package:flutter/material.dart';
import 'leftArticleTiles.dart';
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
            user.name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
        //Page 1
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
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E233C),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      //child: Center(
                        child: Text(
                          "Add your story",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      //),
                    ),
                    // subtitle: Center(
                    //   child: Text(
                    //     "Share your Stories",
                    //     style:
                    //         TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    //tileColor: Color(0xFFFFD3E1),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPost())),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //     side: BorderSide(
                    //       color: Colors.black,
                    //       width: 3.0,
                    //     ),
                    //    ),
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

        //Page 2
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

        //Page 3
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              //height: height - 20,
              child: Column(
                children: [
                  _exploreOptionList(context),
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
                  _exploreOptionList(context),
                ],
              ),
            ),
          ],
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
            title: 'Exercises',
            context: context,
            index: 3,
          ),
          _exploreTiles(
            title: 'Diet',
            context: context,
            index: 4,
          ),
          _exploreTiles(
            title: 'Food',
            context: context,
            index: 5,
          ),
          _exploreTiles(
            title: 'Art',
            context: context,
            index: 6,
          ),
          _exploreTiles(
            title: 'Style',
            context: context,
            index: 7,
          ),
          _exploreTiles(
            title: 'TV & Movies',
            context: context,
            index: 8,
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
