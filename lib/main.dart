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
        '/': (context) => startScreen(),
        '/first': (context) => gamescreen(),
        '/second': (context) => cardsOfPreviousRounds(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:const gamescreen(),
    );
  }
}
