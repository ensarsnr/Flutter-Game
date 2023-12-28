import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  final String winnerTeam;
  const EndGame({super.key, required this.winnerTeam});

  @override
  Widget build(BuildContext context) {
    // bakarız
    return Column(
      children: [
        const Icon(
          Icons.emoji_events_sharp,
          size: 200,
          color: Color.fromARGB(255, 240, 218, 20),
        ),
        Text(
          winnerTeam,
          style: const TextStyle(
              color: Color.fromARGB(255, 74, 74, 74),
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
