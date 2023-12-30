import 'package:flutter/material.dart';
import 'package:flutter_game/product/widgets/buttons/game_buttons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key,
      required this.screenHeight,
      required this.wrongOnPress,
      required this.lifePiece,
      required this.liveOnPress,
      required this.rightOnPress});

  final double screenHeight;
  final VoidCallback wrongOnPress;
  final VoidCallback liveOnPress;
  final String lifePiece;
  final VoidCallback rightOnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.13,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(126, 48, 225, 0.984),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GameButtons(
            onPressed: wrongOnPress,
            backgroundColor: Colors.pink,
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          GameButtons(
            onPressed: liveOnPress,
            backgroundColor: Colors.blue,
            child: Row(
              children: [
                Text(
                  lifePiece,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                ),
                const Icon(
                  Icons.loop,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          GameButtons(
            onPressed: rightOnPress,
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
