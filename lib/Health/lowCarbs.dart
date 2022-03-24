import 'package:flutter/material.dart';
import 'pinkArticleTile.dart';

class LowCarbs extends StatefulWidget {
  const LowCarbs({Key? key}) : super(key: key);

  @override
  State<LowCarbs> createState() => _LowCarbsState();
}

class _LowCarbsState extends State<LowCarbs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PinkArticleTile(
              title: "Low-Carb Diet For Reducing PCOS Symptoms",
              url: "https://consultqd.clevelandclinic.org/reducing-pcos-symptoms-with-a-low-carb-diet/"
          ),
          PinkArticleTile(
              title: "Carbohydrates And Their Role In Nutrition For PCOS ",
              url: "https://www.verywellhealth.com/all-about-carbohydrates-2616475"
          ),
          PinkArticleTile(
              title: "List Of Non-Starchy Food",
              url: "https://www.livestrong.com/article/315391-list-of-foods-with-no-starch-or-sugar/"
          ),
        ],
      ),
    );
  }
}
