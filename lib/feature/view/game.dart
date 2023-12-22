import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        Text(
                          "data",
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
                    decoration: BoxDecoration(
                        color: ColorConstants.THICK_PURPLE,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                                "Takım 1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
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
                              "50",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(248, 161, 89, 255),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Takım 2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
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
            child: Text("data"),
          ),
          Container(
            height: screenHeight * 0.1,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(126, 48, 225, 0.984),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.close, color: Colors.white),
                Icon(Icons.loop, color: Colors.white),
                Icon(Icons.check, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
