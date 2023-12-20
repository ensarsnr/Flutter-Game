import 'package:flutter/material.dart';
import 'package:flutter_game/constants/app_color.dart';
import 'package:flutter_game/product/widgets/container/settings_container.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffbFFD1E3),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Ayarlar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(185, 128, 45, 217),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                initialValue: "Takım 1",
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SettingsContainer(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                initialValue: "Takım 2",
                decoration: const InputDecoration(border: InputBorder.none),
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
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 252, 162, 192),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.vibration_sharp),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 252, 162, 192),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.music_off),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
