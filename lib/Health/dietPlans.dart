import 'package:flutter/material.dart';
import 'pinkArticleTile.dart';

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
          PinkArticleTile(
              title: "PCOS Diet",
              url: "https://www.healthline.com/health/pcos-diet"
          ),
          PinkArticleTile(
              title: "Nutrition Tips For PCOS",
              url: "https://www.unlockfood.ca/en/Articles/Women-s-Health/Nutrition-Tips-for-Polycystic-Ovary-Syndrome-PCOS.aspx"
          ),
          PinkArticleTile(
              title: "Why Your Diet Matters",
              url: "https://www.onpoint-nutrition.com/pcos-diet"
          ),
          PinkArticleTile(
              title: "What To Eat If You Have PCOS",
              url: "https://www.medicalnewstoday.com/articles/323002"
          ),
        ],
      ),
    );
  }
}
