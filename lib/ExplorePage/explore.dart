import 'package:flutter/material.dart';
import 'articleTiles.dart';

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
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: [
        //Page 1
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 13),
                child: _exploreOptionList(context),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "Pregnancy",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        ),
                        Tiles(
                          articleUrl:
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html',
                          imageUrl: 'https://picsum.photos/seed/903/600',
                          categoryName: "New articles",
                        )
                      ],
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
                  _exploreOptionList(context),
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
            title: 'All',
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
            height: 33.5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
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
