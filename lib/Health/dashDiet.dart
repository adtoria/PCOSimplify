import 'package:flutter/material.dart';
import 'pinkArticleTile.dart';

class DashDiet extends StatefulWidget {
  const DashDiet({Key? key}) : super(key: key);

  @override
  State<DashDiet> createState() => _DashDietState();
}

class _DashDietState extends State<DashDiet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PinkArticleTile(
              title: "Why the DASH Diet Is Good for PCOS",
              url: "https://www.verywellhealth.com/reasons-why-the-dash-diet-is-good-for-pcos-2616288"
          ),
          PinkArticleTile(
              title: "All About Dash Diet",
              url: "https://www.healthline.com/nutrition/dash-diet"
          ),
          PinkArticleTile(
              title: "Dash Diet Tips",
              url: "https://www.mayoclinic.org/healthy-lifestyle/nutrition-and-healthy-eating/in-depth/dash-diet/art-20045913"
          ),
        ],
      ),
    );
  }
}
