import 'package:flutter/material.dart';
import 'package:flutter_game/product/widgets/buttons/settings_buttons.dart';
import 'package:flutter_game/product/widgets/container/settings_container.dart';
import 'package:flutter_game/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Color musicOff = Colors.black.withOpacity(0);
  Color vibOff = Colors.black.withOpacity(0);

  // ses ve titreşim ayarı
  bool isVib = true;
  bool isMusic = true;

  // Kullanıcıdan takım adı al
  TextEditingController teamOneController =
      TextEditingController(text: "Takım 1");

  TextEditingController teamTwoController =
      TextEditingController(text: "Takım 2");

  // Puan, saniye ve hak işlemleri
  int point = 20;
  int second = 50;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffbFFD1E3),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Ayarlar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(185, 128, 45, 217),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                controller: teamOneController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                controller: teamTwoController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white, endIndent: 20, indent: 20),
          const SizedBox(height: 20),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ses & Titreşim"),
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingButton(
                          child: Icon(Icons.vibration),
                          color: vibOff,
                          onPressed: () {
                            Vibration.vibrate(duration: 100, amplitude: 1);
                            setState(() {
                              vibOff = isVib
                                  ? const Color.fromARGB(255, 252, 162, 192)
                                  : Colors.black.withOpacity(0);
                              isVib = !isVib;
                            });
                          },
                        ),
                        SettingButton(
                            child: Icon(Icons.music_off),
                            onPressed: () {
                              setState(() {
                                musicOff = isMusic
                                    ? const Color.fromARGB(255, 252, 162, 192)
                                    : Colors.black.withOpacity(0);
                                isMusic = !isMusic;
                              });
                            },
                            color: musicOff)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() => point > 100 ? 100 : point = point + 5);
                    },
                    color: Colors.black.withOpacity(0),
                  ),
                  Text(
                    '${point.toString()} puan',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SettingButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      setState(() => point < 5 ? 5 : point = point - 5);
                    },
                    color: Colors.black.withOpacity(0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() => second > 600 ? 600 : second = second + 10);
                    },
                    color: Colors.black.withOpacity(0),
                  ),
                  Text(
                    '${second.toString()} saniye',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SettingButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      setState(() => second <= 10 ? 10 : second = second - 10);
                    },
                    color: Colors.black.withOpacity(0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: Text(
              'Kaydet',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 15, bottom: 15),
              primary: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {
              settingsProvider.setTeam1(teamOneController.text);
              settingsProvider.setTeam2(teamTwoController.text);
              settingsProvider.setSecond(second);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
