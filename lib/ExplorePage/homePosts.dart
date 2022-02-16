import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'userClass.dart';
import 'addPosts.dart';
import 'viewPosts.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  Stream<List<User>> readData() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: ListTile(
          title: Text(
            user.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            user.name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          tileColor: Colors.pinkAccent,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeeStories(
                        title: user.title,
                        name: user.name,
                        body: user.body,
                      ))),
          contentPadding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: readData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        tooltip: "add a post",
      ),
    );
  }
}
