import 'package:flutter/material.dart';
import 'protein.dart';

class Items{
  final String title;
  final Widget route;

  Items({required this.title,required this.route});
}

List<Items> allItems = [
  Items(
    title: "Protein",
    route: Protein(),
  ),
  Items(
    title: "Iron",
    route: Protein(),
  ),
  Items(
    title: "Fats",
    route: Protein(),
  ),
];