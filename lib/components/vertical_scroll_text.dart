import 'package:flutter/material.dart';

class VerticalScrollText extends StatelessWidget {

  final String text;
  final Color color;
  final VoidCallback onTap;

  VerticalScrollText({required this.text, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 22.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: color),
        ),
      ),
    );
  }
}