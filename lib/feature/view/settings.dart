import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/product/widgets/buttons/settings_buttons.dart';
import 'package:flutter_game/product/widgets/container/settings_container.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Color musicOff = Colors.black.withOpacity(0);
  Color vibOff = Colors.black.withOpacity(0);

  bool isVib = true;
  bool isMusic = true;

  @override
  Widget build(BuildContext context) {
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
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SettingButton(
                          child: Icon(Icons.vibration),
                          color: vibOff,
                          onPressed: () {
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
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                  Text(
                    "20 puan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SettingButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
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
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                  Text(
                    "50 saniye",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SettingButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
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
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                  Text(
                    "50 saniye",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SettingButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    color: Colors.black.withOpacity(0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text(
              'Kaydet',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              padding:
                  EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
