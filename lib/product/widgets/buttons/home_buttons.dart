import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';

class ContainerElevatedButton extends StatelessWidget {
  const ContainerElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.EDELWEISS,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        elevation: 3,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 20,
        child: child,
      ),
    );
  }
}
