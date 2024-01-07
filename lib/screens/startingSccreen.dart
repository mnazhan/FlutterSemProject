import 'package:flutter/material.dart';

import '../screencardfunctions.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color(0xFF272D2D),
            child: Center(
              child: FilledButton(
                child: Text("Start"),
                onPressed: (){
                  print("Move to Game screen");
                  startGameWhenPlayer1Turn();
                  Navigator.pushNamed(context, '/first');
                },
              ),
            ),
          ),
        ));
  }
}
