import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/product/widgets/buttons/game_buttons.dart';
import 'package:flutter_game/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // AYrı bir puanlama değişkeni oluştur
    // takım1 = 0;
    // takım2 = 0;
    // provider'dan aldığım point ile bunları artılarız. takım2 = takım2 + point, eğer doğru bulduysalar.
    // yanlış ise çıkarılır.

    return Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) {
      String team1 = settingsProvider.team1 ?? "Takım 1";
      String team2 = settingsProvider.team2 ?? "Takım 2";
      int second = settingsProvider.second ?? 50;
      int health = settingsProvider.lives ?? 3;
      // Puanlama, default olarak 20 olarak ayarlandı. Kazanan 20 puan alıyor üstüne 40, 50 diye artıyor
      int point = settingsProvider.point ?? 20;

      return Scaffold(
        backgroundColor: ColorConstants.EDELWEISS,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color.fromRGBO(126, 48, 225, 0.984),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          Text(
                            "DABUUU",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.pause,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: ColorConstants.THICK_PURPLE,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: screenHeight * 0.1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(248, 161, 89, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  team1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(248, 161, 89, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                second.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(248, 161, 89, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    team2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              child: Column(
                children: [
                  Text(
                    "Başlık",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                  Divider(
                    height: 2,
                    endIndent: 70,
                    indent: 70,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.13,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(126, 48, 225, 0.984),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GameButtons(
                    onPressed: () {},
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  GameButtons(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          health.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.loop,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    backgroundColor: Colors.lightBlue,
                  ),
                  GameButtons(
                    onPressed: () {},
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
