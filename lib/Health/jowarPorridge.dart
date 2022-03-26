import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class JowarPorridge extends StatefulWidget {
  @override
  State<JowarPorridge> createState() => _JowarPorridgeState();
}

class _JowarPorridgeState extends State<JowarPorridge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jowar Vegetable Porridge",
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
            Content(
                content:
                    "Women with PCOS who need to eat fibre and antioxidants filled diet can include this porridge for breakfast. Tomatoes lend lycopene, onions are brimming with quercetin, coriander and carrot has a good amount of Vitamin C and is also a good source of Vitamin A. All these antioxidants can help reduce inflammation and ensure health of the body."),
            SubHeading(content: "Ingredients"),
            ListWidget(content: "1/2 cup coarsely powdered peanuts"),
            ListWidget(content: "salt to taste"),
            ListWidget(content: "1 teaspoon oil"),
            ListWidget(
                content: "1 cup chopped french beans, carrot, cauliflower"),
            ListWidget(content: "1/2 teaspoon mustard seeds"),
            ListWidget(content: "a pinch of hing"),
            SubHeading(content: "For the topping"),
            ListWidget(content: "2 tbsp finely chopped tomatoes"),
            ListWidget(content: "2 tbsp finely chopped onions"),
            ListWidget(content: "2 tbsp finely chopped coriander"),
            SubHeading(content: "Directions"),
            Content(
                content:
                    "1. Combine the powedered jowar, salt with 3 cups of water in a pressure cooker, mix well and pressure cook for 3 whistles."),
            Content(
                content:
                    "2. Allow the steam to escape before opening the lid."),
            Content(
                content:
                    "3. Heat the oil in a deep pan and add the mustard seeds and hing."),
            Content(
                content:
                    "4. When the mustard seeds crackle, add the mixed vegetables and saute on a medium flame for 3 to 4 minutes."),
            Content(
                content:
                    "5. Add the cooked Jowar mixture, 1.5 cups of water and salt, mix well with simmer for 8 to 10 minutes, while stirring occasionally."),
            Content(
                content:
                    "6. Top with the tomato, onion and coriander and serve immediately."),
            SubHeading(content: "Tips"),
            Content(
                content:
                    "1. Cooking the porridge for 6 to 8 minutes will make it a bit watery but still tasty."),
            Content(
                content:
                    "2. Roasting whole jowar brings out the flavour in the recipe."),
            Content(
                content:
                    "3. If the porridge becomes too thick while serving, adjust its consistency by adding some water."),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
