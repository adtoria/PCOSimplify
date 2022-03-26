import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class JowarRoti extends StatefulWidget {
  @override
  State<JowarRoti> createState() => _JowarRotiState();
}

class _JowarRotiState extends State<JowarRoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jowar Bajra Garlic Roti",
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
            ListWidget(content: "1/2 cup Jowar Flour (Sorghum)"),
            ListWidget(content: "1/2 cup Bajra Flour ( Pearl Millet)"),
            ListWidget(content: "4 cloves Garlic , finely chopped"),
            ListWidget(content: "2 teaspoons Black pepper powder"),
            ListWidget(content: "Salt , as per your taste"),
            ListWidget(content: "Water , for kneading the dough"),
            SubHeading(content: "Directions"),
            Content(
                content:
                "1. To begin making Jowar Bajra Garlic Roti, in a bowl mix jowar flour and bajra flour."),
           Content(content: "2. Add garlic, pepper powder and salt to it. Mix all the ingredients well.",),
            Content(content: "3. Add water little by little and knead into soft dough.",),
            Content(content: "4. Divide into small balls and roll it flat with a rolling pin dusting some flour if required.",),
            Content(content: "5. Heat a roti tawa and place the rolled out Jowar Bajra Garlic Roti.",),
            Content(content: "6. Cook the Jowar Bajra Garlic Roti on a medium flame turning both the sides until brown spots appear. Take it off the griddle, add a teaspoon of ghee on top of the roti. ",),
            Content(content: "7. Finish the rest of the rotis and your Jowar Garlic Roti is ready to be served.",),
            Content(content: "8. Serve Jowar Bajra Garlic Roti Recipe along with Mixed Vegetable Kurma for breakfast.",),
            Content(content: "9. You can even serve the Jowar Bajra Garlic Roti for a Healthy lunch along with Horsegram Dal Recipe - Kulith/Kollu Dal and Raw Jackfruit & Peanut Masala Poriyal Recipe With Sambar Powder for a healthy Diabetic friendly meal. ",),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
