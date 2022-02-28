import 'package:flutter/material.dart';
import 'proteinList.dart';

class FoodPage extends StatelessWidget {
  final ProteinItems item;
  const FoodPage({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Text(item.text),
    );
  }
}