import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  final String winnerTeam;
  final Icon icon;

  const EndGame({super.key, required this.winnerTeam, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
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
