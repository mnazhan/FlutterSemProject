import 'package:cardgame/screens/startingSccreen.dart';
import 'package:cardgame/screens/viewPreviousCards.dart';
import 'package:cardgame/signin.dart';
import 'package:cardgame/signup.dart';
import 'package:cardgame/splash_screen.dart';
import 'package:flutter/material.dart';
import 'gameScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCObMVwgSL8DwHnF2o063aAja3ZOcrPpqU",
          appId: "1:463140521176:web:65c179472ef45cc7bb43ad",
          messagingSenderId: "463140521176",
          projectId: "fluttersemproject")
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        'signup': (context) => const SignUpScreen(),
        'signin': (context) => const SignInScreen(),
        '/': (context) => const startScreen(),
        '/first': (context) => const gamescreen(),
        '/second': (context) => const cardsOfPreviousRounds(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
