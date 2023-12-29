// ignore_for_file: library_private_types_in_public_api
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/feature/view/game_contents.dart';
import 'package:flutter_game/feature/view/home.dart';
import 'package:flutter_game/model/words/words_list.dart';
import 'package:flutter_game/product/widgets/container/end_bottom.dart';
import 'package:flutter_game/product/widgets/container/game/app_bar.dart';
import 'package:flutter_game/product/widgets/container/game/bottom_bar.dart';
import 'package:flutter_game/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:vibration/vibration.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

int randomWords = 0;

class _GameViewState extends State<GameView> with WidgetsBindingObserver {
  bool isPaused = true;
  bool isTimeOver = false;

  // Takım güncellemeleri
  bool isTeamTurn = true;
  int teamPoint1 = 0;
  int teamPoint2 = 0;
  int round = 0;
  int teamLives2 = 3;
  int teamLives1 = 3;

  final CountdownController _timerController =
      CountdownController(autoStart: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Uygulama arka plana düştüğünde zamanlayıcı durduruyoruz.
      isPaused = true;
      _timerController.pause();
    } else if (state == AppLifecycleState.resumed) {
      // Uygulama tekrar ön plana çıktığında zamanlayıcıyı kaldığı yerden devam ettiriyorum
      isPaused = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        // Provider
        String team1 = settingsProvider.team1 ?? "Takım 1";
        String team2 = settingsProvider.team2 ?? "Takım 2";
        int second = settingsProvider.second ?? 50;
        int point = settingsProvider.point ?? 20;
        bool isVib = settingsProvider.vibOff ?? true;

        return Scaffold(
          backgroundColor: ColorConstants.EDELWEISS,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GameAppBar(
                navPaused: () {
                  setState(() {
                    isPaused = !isPaused;
                    if (isPaused) {
                      _timerController.pause();
                    } else {
                      _timerController.resume();
                    }
                  });
                },
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                team1: team1,
                team2: team2,
                teamPoint1: teamPoint1,
                teamPoint2: teamPoint2,
                child: Countdown(
                  controller: _timerController,
                  seconds: second,
                  build: (BuildContext context, double time) {
                    if (isVib) {
                      if (time < 10 && time > 8) {
                        vibratePhone();
                        if (time < 8) {}
                      }
                    } else {}
                    return Text(
                      time.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  interval: const Duration(milliseconds: 100),
                  onFinished: () {
                    setState(() {
                      // Süre bittiğinde takım sırası değişecek
                      isTeamTurn = !isTeamTurn;

                      // Timer'ı sıfırla
                      _timerController.restart();
                      _timerController.pause();
                      isPaused = true;

                      // Her roundda 1 sayı eksilecek.
                      round++;
                      if (round >= 2) {
                        isTimeOver = true;
                      }
                    });
                  },
                ),
              ),

              GameContents(
                  isPaused: isPaused,
                  isTeamTurn: isTeamTurn,
                  isTimeOver: isTimeOver,
                  paused: () {
                    setState(() {
                      isPaused = !isPaused;
                      if (isPaused) {
                        _timerController.pause();
                      } else {
                        _timerController.resume();
                        randomWords = Random().nextInt(tabooWords.length);
                      }
                    });
                  },
                  randomWords: randomWords,
                  tabooWords: tabooWords,
                  team1: team1,
                  team2: team2,
                  teamPoint1: teamPoint1,
                  teamPoint2: teamPoint2),
              // Bottom
              isPaused
                  ? EndBottom(screenHeight: screenHeight)
                  : BottomBar(
                      screenHeight: screenHeight,
                      wrongOnPress: () {
                        setState(
                          () {
                            isPaused
                                ? null
                                : setState(
                                    () {
                                      if (isTeamTurn) {
                                        teamPoint1 = teamPoint1 - point;
                                      } else {
                                        teamPoint2 = teamPoint2 - point;
                                      }
                                      randomWords =
                                          Random().nextInt(tabooWords.length);
                                    },
                                  );
                          },
                        );
                      },
                      lifePiece: isTeamTurn
                          ? teamLives1.toString()
                          : teamLives2.toString(),
                      liveOnPress: () {
                        setState(
                          () {
                            isPaused
                                ? null
                                : setState(
                                    () {
                                      if (isTeamTurn) {
                                        if (teamLives1 > 0) {
                                          teamLives1--;
                                          randomWords = Random()
                                              .nextInt(tabooWords.length);
                                        } else {}
                                      } else {
                                        if (teamLives2 > 0) {
                                          teamLives2--;
                                          randomWords = Random()
                                              .nextInt(tabooWords.length);
                                        } else {}
                                      }
                                    },
                                  );
                          },
                        );
                      },
                      rightOnPress: () {
                        isPaused
                            ? null
                            : setState(
                                () {
                                  if (isTeamTurn) {
                                    teamPoint1 = teamPoint1 + point;
                                  } else {
                                    teamPoint2 = teamPoint2 + point;
                                  }
                                  randomWords =
                                      Random().nextInt(tabooWords.length);
                                },
                              );
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}

void goToHome(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const HomeView()));
}

void vibratePhone() async {
  Vibration.vibrate(duration: 500); // Telefonu 500 milisaniye boyunca titreştir
}
