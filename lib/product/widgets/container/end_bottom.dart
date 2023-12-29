import 'package:flutter/material.dart';
import 'package:flutter_game/feature/view/home.dart';
import 'package:flutter_game/product/widgets/buttons/game_buttons.dart';

class EndBottom extends StatelessWidget {
  final double screenHeight;
  const EndBottom({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.13,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(126, 48, 225, 0.984),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Center(
        child: GameButtons(
            padding: const EdgeInsets.only(top: 100),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeView()));
            },
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            backgroundColor: Colors.pink),
      ),
    );
  }
}
