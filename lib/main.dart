import 'package:e_music/firebase_options.dart';
import 'package:e_music/pages/homePage.dart';
import 'package:e_music/pages/loginPage.dart';
import 'package:e_music/pages/musicPage.dart';
import 'package:e_music/pages/playListPage.dart';
import 'package:e_music/providers/auth_provider.dart';
import 'package:e_music/providers/playing_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayingService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'login': (_) => FuturisticLoginScreen(),
          'home': (_) => HomePage(),
          'musicPage': (_) => MusicPage(),
          'playListPage': (_) => PlayListPage(),
        },
      ),
    );
  }
}
