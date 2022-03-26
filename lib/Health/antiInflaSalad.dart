import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class LentilSalad extends StatefulWidget {
  @override
  State<LentilSalad> createState() => _LentilSaladState();
}

class _LentilSaladState extends State<LentilSalad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lentil, Beetroot, Hazelnut Salad",
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
            ListWidget(content: "175g lentils"),
            ListWidget(content: "1 large or 2 medium-sized beetroots"),
            ListWidget(content: "35g hazelnuts, halved and toasted"),
            ListWidget(content: "400g celeriac"),
            ListWidget(content: "1 lemon, juiced"),
            ListWidget(content: "Vinegar, mustard, parsley for dressing"),
            SubHeading(content: "Directions"),
            Content(content: "1. Heat oven to 190C/170C fan/gas 5. Scrub the beets but don’t peel them. Put them in a roasting tin lined with plenty of foil, drizzle with olive oil and season. Pull the foil around them to make a kind of tent (don’t wrap the beets tightly) and seal the edges. Bake for 1-2 hrs until completely tender right through – the time will depend on the size of the beets."),
            Content(content: "2. For the dressing, combine the vinegar and mustard in a jug, then season. Add the remaining ingredients and whisk until amalgamated."),
            Content(content: "3. Put the lentils in a pan with the stock, bay and thyme. Bring to the boil, then turn down to a very gentle simmer. Cook for 12-15 minutes until the lentils are just tender. The stock will be absorbed as the lentils cook. Drain the lentils and set aside."),
            Content(content: "4. Fill a bowl with water and add the lemon juice. Peel the celeriac and cut it into matchsticks, dropping them into the acidulated water to stop the flesh discolouring. Steam or boil the celeriac until just tender."),
            Content(content: "5. Peel the cooked beets and cut the flesh into small wedges or matchsticks. Drain the celeriac and pat dry. Discard the bay and toss the lentils with the celeriac, hazelnuts, parsley and most of the dressing. Season to taste, then transfer to a serving dish. Season the beets and add them to the salad, spooning the rest of the dressing over the top."),
          ],
        ),
      ),
    );
  }
}
