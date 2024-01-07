import 'package:cardgame/constans.dart';
import 'package:flutter/material.dart';
import 'Functions/functionsOfViewPreviousCards.dart';

class createCardRounds extends StatelessWidget {
  int Round;
  createCardRounds({required this.Round});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF141E1D),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text("Round $Round",style: Kround,),
            ),
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
