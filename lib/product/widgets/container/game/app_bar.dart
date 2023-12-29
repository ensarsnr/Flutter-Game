import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/constants/app_text.dart';
import 'package:flutter_game/feature/view/game.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar(
      {super.key,
      required this.navPaused,
      required this.child,
      required this.screenHeight,
      required this.screenWidth,
      required this.team1,
      required this.team2,
      required this.teamPoint1,
      required this.teamPoint2});

  final VoidCallback navPaused;
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
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext contex) {
                        return AlertDialog(
                          title: const Text(TextConstants.attention),
                          actions: [
                            const Text(TextConstants.info),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorConstants.ALERT_BUTTON_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => goToHome(contex),
                              child: const Text(
                                TextConstants.continueText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const Text(
                  TextConstants.appTitle,
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  color: Colors.white,
                  onPressed: navPaused,
                ),
              ],
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
