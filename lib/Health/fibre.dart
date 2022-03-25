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
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF1E233C),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "Cauliflower Peas Masala (Gobi Matar)",
                    textAlign: TextAlign.center,
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
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF1E233C),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "Vegan Keto Bread",
                    textAlign: TextAlign.center,
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
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF1E233C),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "Bajra and Cauliflower Roti",
                    textAlign: TextAlign.center,
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
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF1E233C),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "Jowar Vegetable Porridge",
                    textAlign: TextAlign.center,
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
