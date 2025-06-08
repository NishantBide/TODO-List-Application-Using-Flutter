import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  Mybutton({
    super.key,
    required this.name,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(name),
      color: Colors.yellow,
    );
  }
}