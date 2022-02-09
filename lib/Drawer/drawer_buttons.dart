import 'package:flutter/material.dart';

class DrawerButtons extends StatelessWidget {
  DrawerButtons({required this.icon, required this.lable, required this.onClicked});
  final IconData icon;
  final String lable;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 16),
          Text(
            lable,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
      onPressed: onClicked,
    );
  }
}