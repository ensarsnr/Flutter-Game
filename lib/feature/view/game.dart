import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/feature/view/home.dart';
import 'package:flutter_game/product/widgets/card/game_card.dart';
import 'package:flutter_game/provider/settings_provider.dart';
import 'package:flutter_game/product/widgets/buttons/game_buttons.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with WidgetsBindingObserver {
  bool isPaused = true;

  // Takım güncellemeleri
  bool isTeamTurn = true;
  int teamPoint1 = 0;
  int teamPoint2 = 0;

  final CountdownController _timerController =
      new CountdownController(autoStart: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Uygulama arka plana düştüğünde zamanlayıcı durduruyoruz.
      _timerController.pause();
    } else if (state == AppLifecycleState.resumed) {
      // Uygulama tekrar ön plana çıktığında zamanlayıcıyı kaldığı yerden devam ettiriyorum
      _timerController.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    int teamHealth = Provider.of<SettingsProvider>(context).lives ?? 3;

    int teamHealt1 = teamHealth;
    int teamHealt2 = teamHealth;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, child) {
        // Provider
        String team1 = settingsProvider.team1 ?? "Takım 1";
        String team2 = settingsProvider.team2 ?? "Takım 2";
        int second = settingsProvider.second ?? 50;
        int health = settingsProvider.lives ?? 3;
        int point = settingsProvider.point ?? 20;

        return Scaffold(
          backgroundColor: ColorConstants.EDELWEISS,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color.fromRGBO(126, 48, 225, 0.984),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.exit_to_app),
                            color: Colors.white,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext contex) {
                                    return AlertDialog(
                                      title: Text("Dikkat!"),
                                      actions: [
                                        Text(
                                          "Oyundan ayrılmak istediğine emin misin?",
                                        ),
                                        ElevatedButton(
                                          onPressed: () => goToHome(contex),
                                          child: Text(
                                            "Devam et",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 253, 130, 122),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                          Text(
                            "DABUUU",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                isPaused = !isPaused;
                                if (isPaused) {
                                  _timerController.pause();
                                } else {
                                  _timerController.resume();
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: ColorConstants.THICK_PURPLE,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: screenHeight * 0.1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(248, 161, 89, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  team1,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  teamPoint1.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(248, 161, 89, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Countdown(
                                controller: _timerController,
                                seconds: second,
                                interval: const Duration(milliseconds: 100),
                                build: (BuildContext context, double time) {
                                  return Text(
                                    time.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                onFinished: () {
                                  setState(() {
                                    // Süre bittiğinde takım sırası değişecek
                                    isTeamTurn = !isTeamTurn;

                                    // Oyun round kısmını buraya ekleyebiliriz. Her döndüğünde 2 şer artması gerekiyor
                                    // Eğer ki kullanıcı 10 el atmak istiyorsa burası 2 katı artması yani 20 kere dönmesi gerekiyor.
                                    // 20 elin sonunda oyun kendisini bitirp en yüksek skoru alan takımı ekranda göstermesi gerekiyor.

                                    // Timer'ı sıfırla

                                    _timerController.restart();
                                    _timerController.pause();
                                    isPaused = !isPaused;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(248, 161, 89, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    team2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    teamPoint2.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: isPaused
                    ? Container(
                        child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.pause,
                              size: 200,
                              color: Color.fromARGB(255, 117, 117, 117),
                            ),
                            onPressed: () {
                              setState(() {
                                isPaused = !isPaused;
                                if (!isPaused) {
                                  _timerController.start();
                                } else {
                                  _timerController.pause();
                                }
                              });
                            },
                          ),
                          Text(
                            isTeamTurn ? team1 : team2,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 117, 117, 117),
                            ),
                          )
                        ],
                      ))
                    : const WordCards(),
              ),
              // Bottom
              Container(
                height: screenHeight * 0.13,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(126, 48, 225, 0.984),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GameButtons(
                      onPressed: () {
                        setState(() {
                          isPaused
                              ? null
                              : setState(() {
                                  if (isTeamTurn) {
                                    teamPoint1 = teamPoint1 - point;
                                  } else {
                                    teamPoint2 = teamPoint2 - point;
                                  }
                                });
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.pink,
                    ),
                    GameButtons(
                      onPressed: () {
                        if (!isPaused) {
                          setState(() {
                            if (isTeamTurn) {
                              teamHealt1 =
                                  teamHealt1 - 1; // Takım 1'in sağlığını eksilt
                            } else {
                              teamHealt2--; // Takım 2'nin sağlığını eksilt
                            }
                            print(teamHealt1);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            teamHealt1.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.loop,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      backgroundColor: Colors.lightBlue,
                    ),
                    GameButtons(
                      onPressed: () {
                        isPaused
                            ? null
                            : setState(() {
                                if (isTeamTurn) {
                                  teamPoint1 = teamPoint1 + point;
                                } else {
                                  teamPoint2 = teamPoint2 + point;
                                }
                              });
                      },
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
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
