import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class AppleJuice extends StatefulWidget {
  @override
  State<AppleJuice> createState() => _AppleJuiceState();
}

class _AppleJuiceState extends State<AppleJuice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Palak, Kale and Apple juice",
          style: TextStyle(
            color: Color(0xFF1E233C),
            fontSize: 21.5,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFDDE3FD),
        foregroundColor: Color(0xFF1E233C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Content(content: "Kale is considered by experts to be one of the most nutrient-dense ingredient in the world, and fortunately for us, it's tasty too, especially when we use the mildly flavoured, small leaved variety."),
            Content(content: "The ingredients of this juice are rich in iron, vitamin C and fibre, which makes it a nutritious snack for weight watchers. While people with obesity and heart problems can enjoy this juice, it is recommended that diabetics should avoid the use of honey."),
            SubHeading(content: "Ingredients"),
            ListWidget(content: "2 cups of spinach, washed and drained"),
            ListWidget(content: "1 cup kale, pieced, washed and drained"),
            ListWidget(content: "1 cup bottle gourd cubes"),
            ListWidget(content: "1/4 cup chopped amla (indian gooseberries)"),
            ListWidget(content: "1 cup green apple cubes"),
            ListWidget(content: "1 tbsp honey"),
            SubHeading(content: "Directions"),
            Content(content: "1. To make Palak Kale Apple Juice, combine all the ingredients in the mixer along with 2 cups of chilled water and blend till smooth.",),
            Content(content: "2. Pour equal quantities of the juice into 4 individual glasses.",),
            Content(content: "3. Refrigerate the juice for at least an hour and serve chilled.",),
            SubHeading(content: "Tips"),
            Content(content: "1. The Vitamin C is a volatile nutrient, so have the drink immediately on blending."),
            Content(content: "2. If you are avoiding the use of honey, you might have to reduce the quantity of amla."),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
