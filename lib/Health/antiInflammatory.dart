import 'package:flutter/material.dart';
import 'package:promject/Health/pineappleSmoothie.dart';
import 'package:promject/Health/turmericScrambledEggs.dart';
import 'greenArticleTile.dart';

class AntiInflammatory extends StatefulWidget {
  const AntiInflammatory({Key? key}) : super(key: key);

  @override
  State<AntiInflammatory> createState() => _AntiInflammatoryState();
}

class _AntiInflammatoryState extends State<AntiInflammatory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GreenArticleTile(
              title: "Anti-Inflammatory Diet Benefits for PCOS",
              url:
                  "https://www.verywellhealth.com/anti-inflammatory-diet-benefits-women-with-pcos-2616296"),
          GreenArticleTile(
              title: "List Of Anti-Inflammatory Foods",
              url:
                  "https://www.healthline.com/nutrition/13-anti-inflammatory-foods"),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TurmericScrambledEggs()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF64B6AC),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Turmeric Scrambled Eggs",
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
                MaterialPageRoute(builder: (context) => PineappleSmoothie()),
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 8, 0),
              child: Container(
                width: 125,
                height: 125,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xFFD4F4F6),
                  border: Border.all(
                    color: Color(0xFF64B6AC),
                    width: 2.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pineapple Smoothie",
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
