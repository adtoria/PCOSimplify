import 'package:flutter/material.dart';
import 'proteinList.dart';

class ProteinDisplay extends StatelessWidget {
  final ProteinItems item;
  const ProteinDisplay({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF1E233C),
        title: Text(item.title),
      ),
      body: Text(item.text),
    );
  }
}