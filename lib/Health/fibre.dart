import 'package:flutter/material.dart';
import 'circularTile.dart';

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
        children: [
          ArticleTile(
              title: "Cauliflower Peas Masala (Gobi Matar)",
              text: "Ingredients\n• 1 medium sized cauliflower\n• 1.5 cups peas, fresh or frozen\n• 3 Tbsp cooking oil\n• 3 medium onions\n• 3 medium tomatoes\n• 7-8 garlic cloves\n• 1 inch ginger\n• 3-4 cloves\n• 5-6 whole peppercorns\n• 1-2 small cinnamon sticks\n• 1/2 tsp cumin seeds\n• 1 jalepenõ or serrano (optional)\n• 1/4 tsp turmeric powder\n• 1 tsp Kashmiri red chili powder or paprika\n• 2 tsp coriander powder\n• Salt, to taste\n• 2 Tbsp cilantro, to garnish"
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
