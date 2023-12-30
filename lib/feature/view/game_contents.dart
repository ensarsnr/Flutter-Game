import 'package:flutter/material.dart';
import 'package:flutter_game/feature/view/game_end.dart';
import 'package:flutter_game/product/widgets/card/game_card.dart';

class GameContents extends StatelessWidget {
  const GameContents(
      {super.key,
      required this.isPaused,
      required this.isTeamTurn,
      required this.isTimeOver,
      required this.paused,
      required this.randomWords,
      required this.tabooWords,
      required this.team1,
      required this.team2,
      required this.teamPoint1,
      required this.teamPoint2});

  final bool isPaused;
  final bool isTimeOver;
  final bool isTeamTurn;
  final int teamPoint1;
  final int teamPoint2;
  final String team1;
  final String team2;
  final List tabooWords;
  final int randomWords;
  final VoidCallback paused;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: isPaused
          ? SizedBox(
              child: Column(
                children: [
                  isTimeOver
                      ? EndGame(
                          icon: teamPoint1 > teamPoint2
                              ? const Icon(
                                  Icons.emoji_events_sharp,
                                  size: 200,
                                  color: Color.fromARGB(255, 240, 218, 20),
                                )
                              : teamPoint2 > teamPoint1
                                  ? const Icon(
                                      Icons.emoji_events_sharp,
                                      size: 200,
                                      color: Color.fromARGB(255, 240, 218, 20),
                                    )
                                  : const Icon(
                                      Icons
                                          .handshake_outlined, // Berabere durumu için handshake ikonu
                                      size: 200,
                                      color: Colors.blue,
                                    ),
                          winnerTeam: teamPoint1 > teamPoint2
                              ? team1
                              : teamPoint1 < teamPoint2
                                  ? team2
                                  : "Berabere",
                        )
                      : Column(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.pause,
                                  size: 200,
                                  color: Color.fromARGB(255, 117, 117, 117),
                                ),
                                onPressed: paused),
                            Text(
                              isTeamTurn ? team1 : team2,
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 117, 117, 117),
                              ),
                            )
                          ],
                        )
                ],
              ),
            )
          : WordCards(listData: tabooWords[randomWords]),
    );
  }
}
