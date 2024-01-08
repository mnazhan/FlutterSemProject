import 'package:cardgame/screens/settingScreen.dart';
import 'package:cardgame/screens/startingSccreen.dart';
import 'package:cardgame/screens/viewPreviousCards.dart';
import 'package:flutter/material.dart';
import 'gameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const startScreen(),
        '/first': (context) => const gamescreen(),
        '/second': (context) => const cardsOfPreviousRounds(),
        '/third' :(context) => const SetingScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
