import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playing_cards/playing_cards.dart';
import 'cards.dart';
import 'cardnotations.dart';
import 'package:cardgame/Functions/gameOMI.dart';

Game omi=Game();

List<playingcard> cardHand(List<int> values) {
  List<playingcard> cardsForPlayer = [];
  for (int i = 0; i < values.length; i++) {
    cardsForPlayer.add(CardNotations(values[i],true));
  }
  return cardsForPlayer;
}

List<Widget> GcardHand(List<int>value) {
  List<Widget> cardsForPlayer = [];
  for (int i = 0; i < value.length; i++) {
    cardsForPlayer.add(
      GestureDetector(
        child: CardNotations(value[i],false),
        onTap: (){
          print("hello world");
        },
      ),
    );
  }
  return cardsForPlayer;
}

FlatCardFan createCardHand(List<int>values) {
  return FlatCardFan(children: cardHand(values));
}

FlatCardFan createGCardHand(List<int> values) {
  return FlatCardFan(children: GcardHand(values));
}

FlatCardFan createCardHandForPlayer1(){
  FlatCardFan cardHand = createGCardHand(omi.getPlayer1Cards());
  return cardHand;
}

FlatCardFan createCardHandForPlayer2(){
  FlatCardFan cardHand = createCardHand(omi.getPlayer2Cards());
  return cardHand;
}

FlatCardFan createCardHandForPlayer3(){
  FlatCardFan cardHand = createCardHand(omi.getPlayer3Cards());
  return cardHand;
}

FlatCardFan createCardHandForPlayer4(){
  FlatCardFan cardHand = createCardHand(omi.getPlayer4Cards());
  return cardHand;
}

Widget createCardForTableOfPlayer1(){
  List<int> turn = omi.getTurn();
  List<int> table= omi.getTable();
  int player1Index=-1;
  if (table.length==0){
    return const Text("Table is Null ");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==1){
        player1Index=i;
      }
    }
    playingcard card = CardNotations(table[player1Index], false);
    return card;
  }
}

Widget createCardForTableOfPlayer2(){
  List<int> turn = omi.getTurn();
  List<int> table= omi.getTable();
  int player1Index=-1;
  if (table.length==0){
    return const Text("Table is Null ");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==2){
        player1Index=i;
      }
    }
    playingcard card = CardNotations(table[player1Index], false);
    return card;
  }
}

Widget createCardForTableOfPlayer3(){
  List<int> turn = omi.getTurn();
  List<int> table= omi.getTable();
  int player1Index=-1;
  if (table.length==0){
    return const Text("Table is Null ");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==3){
        player1Index=i;
      }
    }
    playingcard card = CardNotations(table[player1Index], false);
    return card;
  }
}

Widget createCardForTableOfPlayer4(){
  List<int> turn = omi.getTurn();
  List<int> table= omi.getTable();
  int player1Index=-1;
  if (table.length==0){
    return const Text("Table is Null ");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==4){
        player1Index=i;
      }
    }
    playingcard card = CardNotations(table[player1Index], false);
    return card;
  }
}

FaIcon trumpShape(){
  int trump=omi.getTrump();
  FaIcon icon ;
  if(trump==1){
    icon = const FaIcon(FontAwesomeIcons.solidHandSpock);
  }else if(trump == 2){
    icon=const FaIcon(FontAwesomeIcons.solidHeart);
  }else if (trump ==3){
    icon=const FaIcon(FontAwesomeIcons.solidThumbsUp);
  }else{
    icon=const FaIcon(FontAwesomeIcons.solidGem);
  }
  return icon;
}