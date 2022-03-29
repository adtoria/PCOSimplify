import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String title = "";
  String name = "";
  String body = "";
  bool accept = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future saveToDatabase(
      {required String title,
      required String name,
      required String body}) async {
    final user = FirebaseFirestore.instance.collection('stories').doc();

    final json = {
      'id': user.id,
      'name': name,
      'title': title,
      'body': body,
    };

    await user.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Your Story",
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1E233C),
        elevation: 3.0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9F86C0),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF1E233C),
                      width: 3.0,
                    ),
                  ),
                  labelText: "Title of Your Story",
                  labelStyle: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF9F86C0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return "* Required";
                  } else if (value.length < 1) {
                    accept = false;
                    return "* Required";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  title = val;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9F86C0),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF1E233C),
                      width: 3.0,
                    ),
                  ),
                  labelText: "Your Name",
                  labelStyle: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF9F86C0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null) {
                    name = "Anonymous";
                    return null;
                  } else if (value.length < 1) {
                    name = "Anonymous";
                    return null;
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  name = val;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 20,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9F86C0),
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF1E233C),
                      width: 3.0,
                    ),
                  ),
                  labelText: "Your Story",
                  labelStyle: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF9F86C0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null) {
                    accept = false;
                    return "* Required";
                  } else if (value.length < 1) {
                    accept = false;
                    return "* Required";
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  //post.body = val
                  body = val;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            saveToDatabase(title: title, name: name, body: body);
            Navigator.pop(context);
          }
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: Color(0xFF1E233C),
        tooltip: "Add Story",
      ),
    );
  }
}
