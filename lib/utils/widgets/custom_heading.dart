import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
      textAlign: TextAlign.center,
    );
  }
}
