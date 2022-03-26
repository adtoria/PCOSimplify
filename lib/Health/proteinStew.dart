import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class Stew extends StatefulWidget {
  @override
  State<Stew> createState() => _StewState();
}

class _StewState extends State<Stew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Turmeric Chicken Stew",
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
            Content(content: "•   One 3-to-4-pound chicken, cut into 8 pieces"),
            Content(content: "•   1/4 cup fresh lime juice, plus lime wedges for garnish"),
            Content(content: "•   1/4 cup extra-virgin olive oil"),
            Content(content: "•   1 tablespoon toasted sesame oil"),
            Content(content: "•   1 lemongrass stalk, inner white bulb only, finely chopped"),
            Content(content: "•   One 2-inch piece of fresh ginger, peeled and finely chopped"),
            Content(content: "•   1/2 teaspoon ground turmeric"),
            Content(content: "•   1/2 teaspoon ground coriander"),
            Content(content: "•   1/2 teaspoon ground cumin"),
            Content(content: "•   Kosher salt"),
            Content(content: "•   Pepper"),
            Content(content: "•   1 small red onion, finely chopped"),
            Content(content: "•   6 garlic cloves, finely chopped"),
            Content(content: "•   1 quart low-sodium chicken stock or broth"),
            Content(content: "•   One 15-ounce can of hominy, drained and rinsed"),
            Content(content: "•   1 red bell pepper, thinly sliced"),
            Content(content: "•   1 large carrot, thinly sliced"),
            Content(content: "•   One 4-inch piece of fresh turmeric, finely grated"),
            Content(content: "•   1 Fresno chile, thinly sliced with seeds"),
            Content(content: "•   1/4 cup chopped cilantro leaves, plus small sprigs for garnish"),
            Content(content: "•   Sesame seeds, for garnish"),
            SubHeading(content: "Directions"),
            Content(content: "1. In a large bowl, combine the chicken with the lime juice, 2 tablespoons of the olive oil, the sesame oil, lemongrass, ginger, ground turmeric, coriander and cumin. Season with salt and pepper and toss to coat. Cover with plastic wrap and refrigerate for 1 hour.",),
            Content(content: "2. Remove the chicken from the marinade and reserve the marinade. In a large enameled cast-iron casserole, heat  the remaining 2 tablespoons of olive oil. Working in batches, cook the chicken skin-side down over moderate heat until browned, about 8 minutes. Add the onion and garlic and cook, stirring occasionally until softened, about 5 minutes. Add the stock, hominy, bell pepper, carrot, fresh turmeric, chile, chopped cilantro and the reserved marinade. Cover and bring to a boil, then reduce the heat to moderately low and simmer until the chicken is tender, about 35 minutes.",),
            Content(content: "3. Transfer the chicken to a work surface. Discard the skin and bones and shred the meat with a fork. Return the chicken to the casserole to heat through and season with salt and pepper. Ladle the stew into bowls and garnish with cilantro sprigs, lime wedges and sesame seeds; serve.",),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}