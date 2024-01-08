import 'package:cardgame/signin.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.deepPurple.shade300, // Replace with your start color
              Colors.deepPurple.shade700, // Replace with your end color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Use min to wrap content in the column
            children: <Widget>[
              Image.asset(
                'assets/splash_screen_logo.png', // Your logo here
                width: 260,
                height: 260,
              ),
              SizedBox(height: 24),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple.shade900),),
            ],
          ),
        ),
      ),
    );
  }
}
