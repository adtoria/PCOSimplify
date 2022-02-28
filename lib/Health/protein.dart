import 'package:flutter/material.dart';
import 'displayPage.dart';
import 'proteinList.dart';

class Protein extends StatefulWidget {
  const Protein({Key? key}) : super(key: key);

  @override
  _ProteinState createState() => _ProteinState();
}

class _ProteinState extends State<Protein> {
  List<ProteinItems> items = allItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Protein rich food"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
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
                                builder: (context) => FoodPage(item: item),
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
                ),
              )
            ],
          ),
        )
    );
  }
}
