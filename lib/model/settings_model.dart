import 'package:flutter/foundation.dart';

class Settings extends ChangeNotifier {
  String team1;
  String team2;
  bool vibOff;
  bool musicOff;
  int point;
  int second;

  Settings({
    required this.team1,
    required this.team2,
    required this.musicOff,
    required this.point,
    required this.second,
    required this.vibOff,
  });
}
