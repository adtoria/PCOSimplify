import 'package:flutter/material.dart';
import 'package:promject/Health/proteinStew.dart';
import 'package:promject/Health/proteinTofu.dart';
import 'greenArticleTile.dart';

class LeanProtein extends StatefulWidget {
  const LeanProtein({Key? key}) : super(key: key);

  @override
  State<LeanProtein> createState() => _LeanProteinState();
}

class _LeanProteinState extends State<LeanProtein> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GreenArticleTile(
              title: "Protein & PCOS",
              url: "https://www.verywellhealth.com/all-about-protein-2616481"),
          GreenArticleTile(
              title: "Lean Protein Foods",
              url: "https://www.healthline.com/nutrition/lean-protein-foods"),
          GreenArticleTile(
              title: "10 types of Protein-rich Indian dals",
              url: "https://timesofindia.indiatimes.com/life-style/food-news/10-types-of-protein-rich-indian-dals-and-their-benefits/photostory/88505811.cms"),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tofu()),
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
                      "RECIPE: Tofu",
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
                MaterialPageRoute(builder: (context) => Stew()),
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
                      "RECIPE: Turmeric Chicken Stew",
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
