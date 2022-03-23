import 'package:flutter/material.dart';
import 'protein.dart';
import 'fiber.dart';

class Items {
  final String title;
  final Widget route;

  Items({required this.title, required this.route});
}

List<Items> allItems = [
  Items(
    title: "Diet plans",
    route: Fibre(),
  ),
  Items(
    title: "High Fibre",
    route: Protein(),
  ),
  Items(
    title: "Lean Protein",
    route: Protein(),
  ),
  Items(
    title: "Anti Inflammatory",
    route: Protein(),
  ),
  Items(
    title: "Dash Diet",
    route: Protein(),
  ),
  Items(
    title: "Low Fat",
    route: Protein(),
  ),
  Items(
    title: "Low Starch",
    route: Protein(),
  ),
];
