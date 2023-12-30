// widgets/word_cards.dart
import 'package:flutter/material.dart';
import '../../../model/words/list_data.dart';

class WordCards extends StatelessWidget {
  final ListData listData;

  const WordCards({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          listData.title,
          style: const TextStyle(
              color: Colors.purple, fontSize: 40, fontWeight: FontWeight.w900),
        ),
        const Divider(
          height: 2,
          endIndent: 70,
          indent: 70,
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listData.words.length,
          itemBuilder: (context, index) {
            return Text(
              listData.words[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ],
    );
  }
}
