import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color color;
  const BaseTextButton(
      {super.key, required this.onPressed, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color
        ),
        onPressed: onPressed,
        child:
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)));
  }
}
