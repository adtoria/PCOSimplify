import 'package:flutter/material.dart';
import 'package:promject/Health/dietPlans.dart';

import 'fibre.dart';

class Items {
  final String title;
  final Widget route;

  Items({required this.title, required this.route});
}

List<Items> allItems = [
  Items(
    title: "Diet plans",
    route: DietPlans(),
  ),
  Items(
    title: "High Fibre",
    route: Fibre(),
  ),
  Items(
    title: "Lean Protein",
    route: DietPlans(),
  ),
  Items(
    title: "Anti Inflammatory",
    route: DietPlans(),
  ),
  Items(
    title: "Dash Diet",
    route: DietPlans(),
  ),
  Items(
    title: "Low Fat",
    route: DietPlans(),
  ),
  Items(
    title: "Low Starch",
    route: DietPlans(),
  ),
];
