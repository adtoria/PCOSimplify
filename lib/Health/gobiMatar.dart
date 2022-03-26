import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class GobiMatar extends StatefulWidget {
  @override
  State<GobiMatar> createState() => _GobiMatarState();
}

class _GobiMatarState extends State<GobiMatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gobi Matar",
          style: TextStyle(
            color: Color(0xFF1E233C),
            fontSize: 21.5,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFD3E1),
        foregroundColor: Color(0xFF1E233C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubHeading(content: "Ingredients"),
            ListWidget(content: "1 medium sized cauliflower"),
            ListWidget(content: "1.5 cups peas, fresh or frozen"),
            ListWidget(content: "3 Tbsp cooking oil"),
            ListWidget(content: "3 medium onions"),
            ListWidget(content: "3 medium tomatoes"),
            ListWidget(content: "7-8 garlic cloves"),
            ListWidget(content: "1 inch ginger"),
            ListWidget(content: "3-4 cloves"),
            ListWidget(content: "5-6 whole peppercorns"),
            ListWidget(content: "1-2 small cinnamon sticks"),
            ListWidget(content: "1/2 tsp cumin seeds"),
            ListWidget(content: "1 jalepenõ or serrano (optional)"),
            ListWidget(content: "1/4 tsp turmeric powder"),
            ListWidget(content: "1 tsp Kashmiri red chili powder or paprika"),
            ListWidget(content: "2 tsp coriander powder"),
            ListWidget(content: "Salt, to taste"),
            ListWidget(content: "2 Tbsp cilantro, to garnish"),
            SubHeading(content: "Instructions"),
            Content(
                content:
                    "1. Cut the cauliflower into florets and wash .Chop onions, tomatoes and green chili. Make a rough paste of ginger and garlic."),
            Content(
                content:
                    "2. Heat the oil in a pan over medium heat and add whole spices like cloves, peppercorns and cinnamon, along with cumin seeds and sauté for a few seconds. When the aromas starts coming out of spices, add chopped onions and sauté until golden brown. Add tomatoes and sauté for few minutes. Add salt to taste, along with Kashimri red chili powder (or paprika), turmeric powder and coriander powder. Mix well. Stir in ginger garlic paste and sauté until you get nice homogenous mixture. Continue stirring until you see the oil separating from this mixture."),
            Content(
                content:
                    "3. Add the cauliflower florets and cook covered, checking every few minutes. Make sure it doesn't burn on the bottom. To avoid burning, you can add some water. I like minimum water, about 1/2 cup just to avoid burning. Some prefer a saucier vegetable. In that case you can add more water."),
            Content(
                content:
                    "4. When cauliflower is getting tender, add peas and cook until they are cooked to your desired tenderness."),
            Content(
                content:
                    "5. Garnish with cilantro and serve it with rotis, naan bread or rice. Goes great with my Tomato Cucumber Raita!"),
            SubHeading(content: "Nutritional Information"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Content(content: "Amount Per Serving"),
              ],
            ),
            ListWidget(content: "Calories 232"),
            ListWidget(content: "Total Fat 12g"),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: ListWidget(content: "Saturated Fat 1g"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: ListWidget(content: "Trans Fat 0g"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: ListWidget(content: "Unsaturated Fat 10g"),
            ),
            ListWidget(content: "Cholesterol 0mg"),
            ListWidget(content: "Sodium 196mg"),
            ListWidget(content: "Carbohydrates 28g"),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: ListWidget(content: "Fiber 10g"),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
              child: ListWidget(content: "Sugar 13g"),
            ),
            ListWidget(content: "Protein 8g"),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
