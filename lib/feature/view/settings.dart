import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.EDELWEISS,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ayarlar"),
        backgroundColor: ColorConstants.NANO_WHITE,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.NANO_WHITE,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Ses & Titreşim"),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                      )
                    ],
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
