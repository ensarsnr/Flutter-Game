import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.child});

  final double screenWidth;
  final double screenHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.NANO_WHITE,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
