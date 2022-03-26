import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class Khakra extends StatefulWidget {
  @override
  State<Khakra> createState() => _KhakraState();
}

class _KhakraState extends State<Khakra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Methi Khakhra",
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
            Content(content: "Methi Khakhras are made of whole wheat, which is a rich source of complex Carbohydrates, protein and fibres. The sesame adds to the calcium quotient to this snack while methi gives iron to build our haemoglobin stores."),
            SubHeading(content: "Ingredients"),
            Content(content: "•   2 cups whole wheat flour (gehun ka atta)"),
            Content(content: "•   3/4 cup chopped fenugreek(methi) leaves"),
            Content(content: "•   1 tbsp sesame seeds (til)"),
            Content(content: "•   1/4 tsp turmeric powder (haldi)"),
            Content(content: "•   1/4 tsp chilli powder"),
            Content(content: "•   salt to taste"),
            Content(content: "•   2 tsp oil"),
            Content(content: "•   whole wheat flour for rolling"),
            SubHeading(content: "Directions"),
            Content(content: "1. Combine all the ingredients in a deep bowl and knead into a semi-soft dough using enough water.",),
            Content(content: "2. Divide the dough into 16 equal portions",),
            Content(content: "3. Roll out a portion of the dough and roll it into a circle using a little whole wheat flour for rolling.",),
            Content(content: "4. Heat a concave non-stick tawa(griddle) and cook the khakhra on a slow flame till pink spots appear on both sides.",),
            Content(content: "5. Continue cooking the khakhra on a slow flame, while pressing with a folded muslin cloth, till it turns crisp and golden brown spots appear on both the sides.",),
            Content(content: "6. Cool and serve or store the khakhras in an air tight container.",),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}