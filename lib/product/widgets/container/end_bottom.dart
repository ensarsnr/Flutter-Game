import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/constants/app_text.dart';
import 'package:flutter_game/feature/view/game.dart';

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
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
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
                          backgroundColor: ColorConstants.ALERT_BUTTON_COLOR,
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
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 70),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.white, width: 2),
              ),
            ),
            child: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ));
  }
}
