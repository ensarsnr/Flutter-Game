import 'package:flutter/material.dart';

class GameButtons extends StatelessWidget {
  const GameButtons(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.backgroundColor});

  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 2),
          ),
          elevation: 3,
        ),
        onPressed: () {
          onPressed();
        },
        child: child);
  }
}
