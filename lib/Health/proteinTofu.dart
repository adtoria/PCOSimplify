import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class Tofu extends StatefulWidget {
  @override
  State<Tofu> createState() => _TofuState();
}

class _TofuState extends State<Tofu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tofu",
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
            SubHeading(content: "Ingredients"),
            Content(content: "•   14 ounces extra-firm tofu, patted dry and cubed"),
            Content(content: "•   1/2 tablespoon extra-virgin olive oil"),
            Content(content: "•   2 tablesoons tamari"),
            Content(content: "•   1/2 teaspoon sriracha"),
            Content(content: "•   1 tablespoon cornstarch, optional"),
            SubHeading(content: "Directions"),
            Content(content: "1. Preheat the oven to 425°F and line a baking sheet with parchment paper.",),
            Content(content: "2. Toss the cubed tofu with the olive oil, tamari, and sriracha. For extra crispy tofu, sprinkle with the cornstarch and gently toss to coat.",),
            Content(content: "3. Spread the tofu evenly onto the baking sheet. Bake 20 to 25 minutes or until browned around the edges. Remove and serve warm.",),
            SubHeading(content: "Tips"),
            Content(content: "1. Make sure you select the right texture."),
            Content(content: "In grocery stores, it ranges from silken to firm and extra-firm. Soft silken tofu would be my choice for blending into desserts or slicing into miso soup, but if you’re serving it as a main dish or topping it onto bowls, extra-firm is what you’ll need. It has a heartier, denser texture and less water content than other types of tofu.",),
            Content(content: "2. Press it."),
            Content(content: "Tofu contains a lot of water, and you’ll want to squeeze most of it out, especially if you’re baking, grilling, or frying it. Tofu presses are available in stores, but having one isn’t necessary. You can use a stack of books, or simply use your hands to press it lightly in a kitchen towel or paper towels.",),
            Content(content: "3. Spice. It. Up."),
            Content(content: "There’s a reason that tofu gets flak for being bland, and that’s because it is! Make sure you season it well."),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}