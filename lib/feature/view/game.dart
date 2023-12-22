import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.EDELWEISS,
      ),
      backgroundColor: ColorConstants.EDELWEISS,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.red),
                  width: screenWidth * 0.3,
                  child: Text("takım1"),
                ),
                Container(
                  width: screenWidth * 0.2,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("süre"),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Takım",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("data")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
