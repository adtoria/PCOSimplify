import 'package:flutter/material.dart';
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
              url: "https://www.verywellhealth.com/all-about-protein-2616481"
          ),
          GreenArticleTile(
              title: "Lean Protein Foods",
              url: "https://www.healthline.com/nutrition/lean-protein-foods"
          ),
        ],
      ),
    );
  }
}
