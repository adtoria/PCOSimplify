import 'package:flutter/material.dart';
import 'package:promject/Health/gobiMatar.dart';
import 'package:promject/Health/jowarPorridge.dart';
import 'package:promject/Health/veganKetoBread.dart';
import 'package:promject/Health/bajraCauliflower.dart';
import 'blueArticleTile.dart';

class Fibre extends StatefulWidget {
  const Fibre({Key? key}) : super(key: key);

  @override
  State<Fibre> createState() => _FibreState();
}

class _FibreState extends State<Fibre> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlueArticleTile(
            title: "Fiber & PCOS",
            url: "https://healthyeating.sfgate.com/fiber-pcos-7651.html",
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GobiMatar()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFDDE3FD),
                  border: Border.all(
                    color: Color(0xFF7C90A0),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Gobi Matar",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VeganKetoBread()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFDDE3FD),
                  border: Border.all(
                    color: Color(0xFF7C90A0),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Vegan Keto Bread",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BajraRoti()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFDDE3FD),
                  border: Border.all(
                    color: Color(0xFF7C90A0),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Bajra & Cauliflower Roti",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JowarPorridge()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFDDE3FD),
                  border: Border.all(
                    color: Color(0xFF7C90A0),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Jowar Vegetable Porridge",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
