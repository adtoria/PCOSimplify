import 'package:flutter/material.dart';
import 'blueArticleTile.dart';

class LowFat extends StatefulWidget {
  const LowFat({Key? key}) : super(key: key);

  @override
  State<LowFat> createState() => _LowFatState();
}

class _LowFatState extends State<LowFat> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BlueArticleTile(
              title: "Lose Weight With PCOS By Eating Healthy",
              url: "https://www.healthline.com/nutrition/how-to-lose-weight-with-pcos"
          ),
          BlueArticleTile(
              title: "PCOS Weight Loss Recipes",
              url: "https://www.tarladalal.com/recipes-for-pcos-weight-loss-1042"
          ),
          BlueArticleTile(
              title: "Low Fat Foods That Are Good For Health",
              url: "https://www.healthline.com/nutrition/healthy-low-fat-foods"
          ),
          BlueArticleTile(
              title: "A Guide To Low Fat Foods",
              url: "https://www.medicalnewstoday.com/articles/325860"
          ),
        ],
      ),
    );
  }
}
