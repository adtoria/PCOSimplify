import 'package:flutter/material.dart';
import 'blueArticleTile.dart';

class Fibre extends StatefulWidget {
  const Fibre({Key? key}) : super(key: key);

  @override
  State<Fibre> createState() => _FibreState();
}

class _FibreState extends State<Fibre> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlueArticleTile(
            title: "Fiber & PCOS",
            url: "https://healthyeating.sfgate.com/fiber-pcos-7651.html"
        ),
      ],
    );
  }
}
