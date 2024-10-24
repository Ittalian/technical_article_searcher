import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const BaseTextButton(
      {super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child:
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)));
  }
}
