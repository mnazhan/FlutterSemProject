import 'package:flutter/cupertino.dart';
import 'package:playing_cards/playing_cards.dart';
import 'cards.dart';
import 'cardnotations.dart';


List<playingcard> cardHand(int num,List<int> values) {
  List<playingcard> cardsForPlayer = [];
  for (int i = 0; i < num; i++) {
    cardsForPlayer.add(CardNotations(values[i]));
  }
  return cardsForPlayer;
}

List<Widget> GcardHand(int num,List<int>value) {
  List<Widget> cardsForPlayer = [];
  for (int i = 0; i < num; i++) {
    cardsForPlayer.add(
      GestureDetector(
        child: CardNotations(value[i]),
        onTap: (){
          print("hello world");
        },
      ),
    );
  }
  return cardsForPlayer;
}

FlatCardFan createCardHand(int value,List<int>values) {
  return FlatCardFan(children: cardHand(value,values));
}

FlatCardFan createGCardHand(int value,List<int> values) {
  return FlatCardFan(children: GcardHand(value,values));
}

