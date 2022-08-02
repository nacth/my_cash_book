import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({
    Key? key,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
    this.decorationThickness = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    required this.text,
  }) : super(key: key);

  final Color color;
  final TextDecoration decoration;
  final double decorationThickness;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
