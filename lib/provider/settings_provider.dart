import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String? team1;
  String? team2;
  bool? musicOff;
  int? point;
  int? second;
  bool? vibOff;

  void setTeam1(String value) {
    team1 = value;
    notifyListeners();
  }

  void setTeam2(String value) {
    team2 = value;
    notifyListeners();
  }

  void setMusicOff(bool value) {
    musicOff = value;
    notifyListeners();
  }

  void setPoint(int value) {
    point = value;
    notifyListeners();
  }

  void setSecond(int value) {
    second = value;
    notifyListeners();
  }

  void setVibOff(bool value) {
    vibOff = value;
    notifyListeners();
  }
}
