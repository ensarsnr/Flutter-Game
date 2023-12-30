import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingButton extends StatelessWidget {
  SettingButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color});

  final Widget child;
  final VoidCallback onPressed;
  Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: const Color.fromARGB(255, 252, 162, 192), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
