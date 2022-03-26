import 'package:flutter/material.dart';
import 'package:promject/content.dart';
import 'package:promject/heading.dart';
import 'package:promject/subHeading.dart';
import 'package:promject/listWidget.dart';

class VeganKetoBread extends StatefulWidget {
  @override
  State<VeganKetoBread> createState() => _VeganKetoBreadState();
}

class _VeganKetoBreadState extends State<VeganKetoBread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vegan Keto Bread",
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
            Heading(content: "Directions"),
            SubHeading(content: "1. Making the Bread Dough"),
            Content(
                content:
                    "Start by adding the almond flour, coconut flour, ground flaxseeds, psyllium husk, baking powder, and salt to a large bowl and whisk together. Next, add the canola oil, water, and apple cider vinegar and mix with a spatula or wooden spoon until it comes together. Continue kneading with your hands briefly until it forms a dough."),
            SubHeading(content: "2. Shape into a Loaf"),
            Content(
                content:
                    "Now shape the dough into a loaf so that’s a little smaller than your pan. Then smooth out the surface with damp hands gently."),
            SubHeading(content: "3. Top with Seeds or Kernels and Bake"),
            Content(
                content:
                    "Now place the loaf on a piece of parchment paper and lift it into the pan. Sprinkle with sunflower seeds as desired and bake for 60-70 minutes in a preheated oven at 400°F (200°C), or until a skewer inserted into the center of your loaf comes out clean. Once done baking, lift the loaf out of the pan using the overhanging parchment paper. Place onto a wire rack and allow it to cool completely before slicing."),
            SubHeading(content: "Tips while making Vegan Keto Bread:"),
            Content(
                content:
                    "1. You can use other types of baking pans for this recipe. It is important to grease your pan and line it with parchment paper to ensure the bread does not stick. To make it easier for you to pull out the bread after baking, leave some parchment paper hanging on the sides of the pan."),
            Content(
                content:
                    "2. The dough will be very sticky and watery once the ingredients are mixed. You have to be patient until the fiber absorbs the liquid and it firms up."),
            Content(
                content:
                    "3. After kneading, shape and place the dough in your baking pan, but do it gently. Do not press or flatten the dough too much or you will end up with dense and dry bread."),
            Content(
                content:
                    "4. The baking time depends on the size of the pan, the oven, and the temperature used. It’s always best to check for doneness by inserting a skewer in the center of the loaf. If it comes out clean, then you can pull it out from the oven."),
            Content(
                content:
                    "5. If it’s not yet done but you see the top part browning too much, you can loosely place parchment paper on top to prevent it from further darkening."),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 5),
                  child: Text(
                    "This recipe is",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontFamily: 'RaleWay',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            ListWidget(content: "Low carb and fiber rich"),
            ListWidget(content: "Eggless"),
            ListWidget(content: "Diary-free"),
            ListWidget(content: "Gluten-free"),
            ListWidget(content: "Sugar-free"),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
