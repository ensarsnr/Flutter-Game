import 'package:flutter/material.dart';

class ContainerElevatedButton extends StatelessWidget {
  const ContainerElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.backgroundColor,
    required this.height,
    required this.width,
  });
  final Widget child;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 3,
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
