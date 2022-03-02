import 'package:flutter/material.dart';
import 'fibreDisplayPage.dart';
import 'fibreList.dart';

class Fibre extends StatefulWidget {
  const Fibre({Key? key}) : super(key: key);

  @override
  _FibreState createState() => _FibreState();
}

class _FibreState extends State<Fibre> {
  List<FibreItems> items = allItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF1E233C),
            title: Text("High fibre food"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    final item=items[index];

                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.food_bank),
                        ),
                        title: Text(item.title),
                        tileColor: Colors.pinkAccent,
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => FibreDisplay(item: item),
                              )
                          );
                        },
                        contentPadding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}