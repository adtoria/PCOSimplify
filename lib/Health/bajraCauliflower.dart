import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subheading.dart';
import 'package:promject/listWidget.dart';

class BajraRoti extends StatefulWidget {
  @override
  State<BajraRoti> createState() => _BajraRotiState();
}

class _BajraRotiState extends State<BajraRoti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bajra and Cauliflower Roti",
          style: TextStyle(
              fontSize: 23.5,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E233C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubHeading(content: "Ingredients"),
            ListWidget(content: "1/2 cup black millet flour"),
            ListWidget(content: "2 tablespoon spring onions"),
            ListWidget(content: "1/2 tablespoon ginger paste"),
            ListWidget(content: "4 pinches salt"),
            ListWidget(content: "3/4 cup grated cauliflower"),
            ListWidget(content: "2 tablespoon chopped coriander leaves"),
            ListWidget(content: "1/2 teaspoon garlic paste"),
            SubHeading(content: "Instructions"),
            Content(content: "1. Combine all the ingredients in a deep bowl and knead into soft-smooth dough, using enough water."),
            Content(content: "2. Divide the dough into small balls."),
            Content(content: "3. Roll out one portion of the dough and make roti."),
            Content(content: "4. Place the roti on a hot tava. Turn over in a few seconds."),
            Content(content: "5. Cook the other side for a few more seconds."),
            Content(content: "6. Serve hot with curry of your choice."),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}