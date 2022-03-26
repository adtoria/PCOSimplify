import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class PineappleSmoothie extends StatefulWidget {
  @override
  State<PineappleSmoothie> createState() => _PineappleSmoothieState();
}

class _PineappleSmoothieState extends State<PineappleSmoothie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pineapple Smoothie",
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
            ListWidget(content: "Chopped pineapple"),
            ListWidget(content: "Coconut milk"),
            ListWidget(content: "Cinnamon powder, ginger powder"),
            SubHeading(content: "Directions"),
            Content(
                content:
                    "1. Take 2 cups chopped pineapple in a blender or mixer jar."),
            Content(
                content:
                    "2. Add ½ cup of coconut milk (thin to medium consistency)."),
            Content(
                content:
                    "3. Add 1 pinch cinnamon powder. You can also add a bit of fresh ginger or ginger powder."),
            Content(
                content:
                    "4. Blend till the pineapple pieces are pureed well. There should be no small chunks of pineapple."),
            Content(
                content:
                    "5. Then add the remaining 1 cup of coconut milk (thin to medium consistency). Blend again till everything is mixed well."),
            Content(
                content:
                    "6. Pour in glasses. You can serve with pineapple cubes or cherries."),
          ],
        ),
      ),
    );
  }
}
