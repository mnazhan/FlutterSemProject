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
              Color(0xff141E1D).withOpacity(0.7), // Lighter shade of your hex color
              Color(0xff141E1D), // Darker shade with some transparency
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
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff141E1D)),),
            ],
          ),
        ),
      ),
    );
  }
}
