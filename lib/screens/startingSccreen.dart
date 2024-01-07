import 'package:cardgame/constans.dart';
import 'package:flutter/material.dart';

import '../screencardfunctions.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xFF141E1D),
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

              ]
            ),
          ),
        ));
  }
}
