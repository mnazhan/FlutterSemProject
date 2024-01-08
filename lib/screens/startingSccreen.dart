import 'package:cardgame/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screencardfunctions.dart';
import '../signin.dart';

class startScreen extends StatefulWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {

  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            //color: const Color(0xFF141E1D),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.deepPurple.shade300, // Replace with your start color
                  Colors.deepPurple.shade700, // Replace with your end color
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Rang",style:KtitleStyle),
                ),
                const Center(
                  child: Text("OMI",style:KtitleStyle),
                ),
                SizedBox(height: 30,),
                Center(
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor:const Color(0xFFCCD5DE) ),
                    child: const Text("Start",style: TextStyle(color: Colors.black),),
                    onPressed: (){
                      print("Move to Game screen");
                      startGameWhenPlayer1Turn();
                      Navigator.pushNamed(context, '/first');
                    },
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: FilledButton(
                    style: FilledButton.styleFrom(backgroundColor:const Color(0xFFCCD5DE) ),
                    child: const Text("Logout",style: TextStyle(color: Colors.black),),
                    onPressed: (){
                      print("Logging out");
                      _logout();
                    },
                  ),
                ),

              ]
            ),
          ),
        ));
  }
}
