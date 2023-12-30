import 'package:flutter/material.dart';

class GameButtons extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GameButtons({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
    padding,
  }) : padding =
            const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30);

  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 3,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
