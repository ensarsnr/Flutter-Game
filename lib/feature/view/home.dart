import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/constants/app_text.dart';
import 'package:flutter_game/product/widgets/buttons/home_buttons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
              StringConstants.appTitle,
              style: TextStyle(
                  fontSize: screenWidth * 0.3, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.1),
            Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                color: ColorConstants.ZANAH,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.08,
                    width: screenWidth * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.EDELWEISS,
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                      onPressed: () {},
                      child: Text(
                        StringConstants.playButton,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: screenWidth * 0.08,
                            color: ColorConstants.ALGA_MOSS),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  ContainerElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      StringConstants.settingsButton,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: ColorConstants.ALGA_MOSS),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ContainerElevatedButton(
                    child: const Text(
                      StringConstants.exitButton,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: ColorConstants.ALGA_MOSS),
                    ),
                    onPressed: () {},
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
