import 'package:cardgame/Functions/gameOMI.dart';
import 'package:cardgame/cardnotations.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'main.dart';
import 'screencardfunctions.dart';

// List<PlayingCard> deck = standardFiftyTwoCardDeck();
int player1cardNumber = 8;
int player2cardNumber = 8;
int player3cardNumber = 8;
int playerc4ardNumber = 8;

Game omi = Game();

class gamescreen extends StatelessWidget {
  const gamescreen({
    super.key,
    required this.widget,
  });
  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: createCardHand(8, omi.getPlayer1Cards()),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        color: Colors.yellow,
                        child: Transform.rotate(
                          angle: 90 * (3.1415926535 / 180),
                          child: createCardHand(8, omi.getPlayer2Cards()),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: double.infinity,
                        color: Colors.brown,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                width: double.infinity,
                                child: Center(
                                  child: CardNotations(1),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: double.infinity,
                                      color: Colors.yellow,
                                      child: Center(
                                        child: CardNotations(1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.purple,
                                      height: double.infinity,
                                      child:const Center(
                                          child: Icon(Icons.diamond)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.yellow,
                                      height: double.infinity,
                                      child: Center(
                                        child: CardNotations(1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                width: double.infinity,
                                child: Center(
                                  child: CardNotations(1),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        color: Colors.yellow,
                        child: Transform.rotate(
                          angle: 90 * (3.1415926535 / 180),
                          child: createCardHand(8, omi.getPlayer3Cards()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: createGCardHand(8, omi.getPlayer4Cards())),
              ),
            ],
          )),
    );
  }
}
