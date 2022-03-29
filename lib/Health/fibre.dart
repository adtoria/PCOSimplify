import 'package:flutter/material.dart';
import 'package:promject/Health/fibreAppleJuice.dart';
import 'package:promject/Health/fibreGobiMatar.dart';
import 'package:promject/Health/fibreJowarPorridge.dart';
import 'package:promject/Health/fibreJowarRoti.dart';
import 'package:promject/Health/fibreMethiKhakra.dart';
import 'package:promject/Health/fibreVeganKetoBread.dart';
import 'package:promject/Health/fibreBajraCauliflower.dart';
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => GobiMatar()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Gobi Matar",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => VeganKetoBread()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Vegan Keto Bread",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BajraRoti()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Bajra & Cauliflower Roti",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => JowarPorridge()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Jowar Vegetable Porridge",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => JowarRoti()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Jowar Bajra Garlic Roti",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AppleJuice()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Palak, Kale and Apple juice",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Khakra()),
                    (Route<dynamic> route) => false,);
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
                      "RECIPE: Methi Khakhra",
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
