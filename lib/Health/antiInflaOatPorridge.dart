import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class OatPorridge extends StatefulWidget {
  @override
  State<OatPorridge> createState() => _OatPorridgeState();
}

class _OatPorridgeState extends State<OatPorridge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oats Porridge",
          style: TextStyle(
            color: Color(0xFF1E233C),
            fontSize: 21.5,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD4F4F6),
        foregroundColor: Color(0xFF1E233C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubHeading(content: "Ingredients"),
            ListWidget(content: "½ cup oats"),
            ListWidget(content: "½ to 1 cup milk, water"),
            ListWidget(content: "2 tbsp sugar, fruits or honey for sweetness"),
            SubHeading(content: "Directions"),
            Content(content: "1. Take ½ cup quick-cooking oats or rolled oats in a pan."),
            Content(content: "2. Add 2 cups of water."),
            Content(content: "3. Add ½ to 1 cup milk. Consistency can be easily adjusted as per your requirements. ½ cup milk gives a slightly thick consistency. For a thinner consistency, you can add more milk or water."),
            Content(content: "4. Add sugar as per taste. I just added 2 tbsp sugar. Sugar is completely optional. If adding fruits later, then you can skip sugar. If adding honey, then add when the porridge becomes lukewarm or cools down at room temperature, as honey when heated becomes toxic."),
            Content(content: "5. Stir very well and heat the oats porridge mixture on a low to medium flame."),
            Content(content: "6. Do stir often at times and allow the porridge to simmer."),
            Content(content: "7. The porridge will also thicken as it cooks. Cook for 5 to 6 minutes."),
          ],
        ),
      ),
    );
  }
}