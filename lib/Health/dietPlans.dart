import 'package:flutter/material.dart';
import 'circularTile.dart';

class DietPlans extends StatefulWidget {
  const DietPlans({Key? key}) : super(key: key);

  @override
  State<DietPlans> createState() => _DietPlansState();
}

class _DietPlansState extends State<DietPlans> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.healthline.com/health/pcos-diet"
          ),
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.healthline.com/health/pcos-diet"
          ),
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.healthline.com/health/pcos-diet"
          ),
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.healthline.com/health/pcos-diet"
          ),
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.healthline.com/health/pcos-diet"
          ),
          ArticleTile(
              title: "Pcos diet",
              text: "https://www.medicalnewstoday.com/articles/323002"
          ),
        ],
      ),
    );
  }
}
