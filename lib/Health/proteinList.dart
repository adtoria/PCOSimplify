import 'package:flutter/material.dart';

class ProteinItems{
  final String title;
  final String text;

  ProteinItems({required this.title,required this.text});
}

List<ProteinItems> allItems = [
  ProteinItems(
    title: "Egg",
    text: "hello",
  ),
  ProteinItems(
    title: "Dal Rice",
    text: "hello",
  ),
  ProteinItems(
    title: "Dosa",
    text: "hello",
  ),
];