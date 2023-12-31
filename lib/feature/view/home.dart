import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/constants/app_text.dart';
import 'package:flutter_game/feature/view/game.dart';
import 'package:flutter_game/feature/view/settings.dart';
import 'package:flutter_game/product/widgets/buttons/home_buttons.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.GREEN_MYTH,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextConstants.appTitle,
              style: TextStyle(
                  fontSize: screenWidth * 0.2,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.NANO_WHITE),
            ),
            SizedBox(height: screenHeight * 0.1),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerElevatedButton(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.5,
                    backgroundColor: ColorConstants.PLAY_BUTTON,
                    child: const Text(
                      TextConstants.playButton,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: ColorConstants.NANO_WHITE),
                    ),
                    onPressed: () => goToGame(context),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ContainerElevatedButton(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.5,
                    backgroundColor: ColorConstants.SETTINGS_BUTTON,
                    child: const Text(
                      TextConstants.settingsButton,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: ColorConstants.NANO_WHITE),
                    ),
                    onPressed: () => goToSettings(context),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ContainerElevatedButton(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    backgroundColor: ColorConstants.EXIT_BUTTON,
                    child: const Text(
                      TextConstants.exitButton,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: ColorConstants.NANO_WHITE),
                    ),
                    onPressed: () {
                      // Uygulamayı kapatıyor.
                      exit(0);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void goToSettings(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SettingsView(),
    ),
  );
}

void goToGame(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const GameView()));
}
