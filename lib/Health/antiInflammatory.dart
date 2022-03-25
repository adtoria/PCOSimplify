import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}
