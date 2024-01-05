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

List<Widget> GcardHand(List<int>value,VoidCallback onTapCallback) {
  List<Widget> cardsForPlayer = [];
  for (int i = 0; i < value.length; i++) {
    cardsForPlayer.add(
      GestureDetector(
        child: CardNotations(value[i],false),
        onTap: (){
          onTapCallback();
        },
      ),
    );
  }
  return cardsForPlayer;
}

FlatCardFan createCardHand(List<int>values) {
  return FlatCardFan(children: cardHand(values));
}

FlatCardFan createGCardHand(List<int> values,VoidCallback onTapCallback) {
  return FlatCardFan(children: GcardHand(values,onTapCallback));
}

FlatCardFan createCardHandForPlayer1(VoidCallback onTapCallback){
  FlatCardFan cardHand = createGCardHand(omi.getPlayer1Cards(),onTapCallback);
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
    if(player1Index+1>table.length){
      return const Text("Table is Null ");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
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
    if(player1Index+1>table.length){
      return const Text("Table is Null ");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
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
    if(player1Index+1>table.length){
      return const Text("Table is Null ");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
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
    if(player1Index+1>table.length){
      return const Text("Table is Null ");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
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

void setStartingCardForPlayer1ToTable(){
  omi.throwStartCard(omi.getPlayer1Cards());
}

void setStartingCardForPlayer2ToTable(){
  omi.throwStartCard(omi.getPlayer2Cards());
}

void setStartingCardForPlayer3ToTable(){
  omi.throwStartCard(omi.getPlayer3Cards());
}

void setStartingCardForPlayer4ToTable(){
  omi.throwStartCard(omi.getPlayer4Cards());
}

void setCardForPlayer2ToTable(){
  omi.throwSecondCard(omi.getPlayer2Cards());
}

void setCardForPlayer1ToTable(){
  omi.throwSecondCard(omi.getPlayer1Cards());
}

void setCardForPlayer3ToTable(){
  omi.throwSecondCard(omi.getPlayer3Cards());
}

void setCardForPlayer4ToTable(){
  omi.throwSecondCard(omi.getPlayer4Cards());
}

void findthewinningPlayer(){
  omi.findTheWinner(omi.getTable());
  print("team 1 :");
  print(omi.getPointOfTeam1());
  print("team 2 :");
  print(omi.getPointOfTeam2());
}

Text team1Points(){
  int points =omi.getPointOfTeam1();
  return Text("$points");
}
Text team2Points(){
  int points =omi.getPointOfTeam2();
  return Text("$points");
}

bool checkPlayer1Permission (){
  int permission = omi.getPlayer1Permission();
  if(permission==0){
    return false;
  }else{
    return true;
  }
}