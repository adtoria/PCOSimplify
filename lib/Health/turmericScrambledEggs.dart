import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class TurmericScrambledEggs extends StatefulWidget {
  @override
  State<TurmericScrambledEggs> createState() => _TurmericScrambledEggsState();
}

class _TurmericScrambledEggsState extends State<TurmericScrambledEggs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Turmeric Scrambled Eggs",
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
            ListWidget(content: "3 Eggs"),
            ListWidget(content: "Ground or grated peeled fresh turmeric"),
            ListWidget(content: "Salt & pepper for seasoning"),
            ListWidget(
                content: "Chopped chives, parsley and dill for toppings"),
            ListWidget(content: "Butter"),
            SubHeading(content: "Directions"),
            Content(
                content:
                    "1. Whisk 3 eggs with 1 tablespoon water; season with salt and pepper."),
            Content(
                content:
                    "2. Heat 1 tablespoon butter in a nonstick skillet over medium heat."),
            Content(
                content:
                    "3. Add 1 tablespoon grated peeled fresh turmeric (or 1 teaspoon ground) and cook, stirring, 15 to 30 seconds."),
            Content(
                content:
                    "4. Add the eggs, reduce the heat to medium low and cook, stirring, until just set, about 3 minutes."),
            Content(content: "5. Top with chopped chives, parsley and dill."),
          ],
        ),
      ),
    );
  }
}
