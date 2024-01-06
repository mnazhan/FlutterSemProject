import 'package:flutter/material.dart';
import 'Functions/functionsOfViewPreviousCards.dart';

class createCardRounds extends StatelessWidget {
  int Round;
  createCardRounds({required this.Round});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        children: [
          Container(
            child: Text("Round $Round"),
          ),
          Container(
            height: 100,
            child: createCardForRoundsOfPlayer3(Round),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                child: createCardForRoundsOfPlayer4(Round),
              ),
              Container(
                height: 100,
                child: createCardForRoundsOfPlayer2(Round),
              ),
            ],
          ),
          Center(
            child: Container(
              height: 100,
              child: createCardForRoundsOfPlayer1(Round),
            ),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
