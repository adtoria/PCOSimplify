import 'package:flutter/material.dart';
import 'package:promject/Health/antiInflammatory.dart';
import 'package:promject/Health/dashDiet.dart';
import 'package:promject/Health/dietPlans.dart';
import 'package:promject/Health/leanProtein.dart';
import 'package:promject/Health/lowCarbs.dart';
import 'package:promject/Health/lowFat.dart';

import 'fibre.dart';

class Items {
  final String title;
  final Widget route;

  Items({required this.title, required this.route});
}

List<Items> allItems = [
  Items(
    title: "Diet & PCOS",
    route: DietPlans(),
  ),
  Items(
    title: "High Fiber",
    route: Fibre(),
  ),
  Items(
    title: "Lean Protein",
    route: LeanProtein(),
  ),
  Items(  //DONE
    title: "Dash Diet",
    route: DashDiet(),
  ),
  Items(  //DONE
    title: "Low Fat",
    route: LowFat(),
  ),
  Items(
    title: "Anti Inflammatory",
    route: AntiInflammatory(),
  ),
  Items(
    title: "Low Carbs",
    route: LowCarbs(),
  ),
];
