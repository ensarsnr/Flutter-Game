import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/feature/view/home.dart';
import 'package:flutter_game/provider/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Uygulamanın tam ekran modunda çalışmasına yarıyor.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Game',
      home: HomeView(),
    );
  }
}
