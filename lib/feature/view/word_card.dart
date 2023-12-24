import 'package:flutter/material.dart';

class WordCards extends StatelessWidget {
  const WordCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Başlık",
          style: TextStyle(
              color: Colors.purple, fontSize: 60, fontWeight: FontWeight.w900),
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
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "data",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "data",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "data",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "data",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
