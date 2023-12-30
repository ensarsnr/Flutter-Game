import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/constants/app_text.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar(
      {super.key,
      required this.child,
      required this.screenHeight,
      required this.screenWidth,
      required this.team1,
      required this.team2,
      required this.teamPoint1,
      required this.teamPoint2});

  final double screenHeight;
  final double screenWidth;
  final String team1;
  final String team2;
  final int teamPoint1;
  final int teamPoint2;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: Color.fromRGBO(126, 48, 225, 0.984),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                TextConstants.appTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: ColorConstants.THICK_PURPLE,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: ColorConstants.NAV_BACKGROUND,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: screenWidth * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        team1,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        teamPoint1.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: ColorConstants.NAV_BACKGROUND,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: child,
                  ),
                ),
                Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      color: ColorConstants.NAV_BACKGROUND,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          team2,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          teamPoint2.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
