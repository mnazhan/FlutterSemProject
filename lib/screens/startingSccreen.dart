import 'package:flutter/material.dart';

import '../screencardfunctions.dart';

class startScreen extends StatelessWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: FilledButton(
              child: Text("Start"),
              onPressed: (){
                print("Move to Game screen");
                startTheGameWhenPlayer1Trump();
                Navigator.pushNamed(context, '/first');
              },
            ),
          ),
        ));
  }
}
