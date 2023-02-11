import 'package:e_music/pages/homePage.dart';
import 'package:e_music/pages/musicPage.dart';
import 'package:e_music/pages/playListPage.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'musicPage': (_) => MusicPage(),
        'playListPage': (_) => PlayListPage(),
      },
    );
  }
}
