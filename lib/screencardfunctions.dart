import 'package:cardgame/Functions/team.dart';
import 'package:cardgame/gameScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'cards.dart';
import 'cardnotations.dart';
import 'package:cardgame/Functions/gameOMI.dart';
import 'constans.dart';

Team team1=Team();
Team team2=Team();

int terminateGame =0;
int gameTurn =1;
int beginnerOfTheTurn=1;

void findTheBeginnersForTurn(){
  if(gameTurn==1||gameTurn==5||gameTurn==9||gameTurn==13||gameTurn==17){
    beginnerOfTheTurn=1;
  }else if(gameTurn==2||gameTurn==6||gameTurn==10||gameTurn==14||gameTurn==18){
    beginnerOfTheTurn=2;
  }else if(gameTurn==3||gameTurn==7||gameTurn==11||gameTurn==15||gameTurn==19){
    beginnerOfTheTurn=3;
  }else if(gameTurn==4||gameTurn==8||gameTurn==12||gameTurn==16||gameTurn==20){
    beginnerOfTheTurn=4;
  }
}

Game omi=Game(beginnerOfTheTurn);

Game newGame(){
  findTheBeginnersForTurn();
  Game temp=Game(beginnerOfTheTurn);
  temp.setTrump();
  gameTurn++;
  return temp;
}

Game newGameWhenPlayer1Trump(){
  findTheBeginnersForTurn();
  Game temp=Game(1);
  gameTurn++;
  // omi.setTrump();
  return temp;
}

void startGame(){
  omi=newGame();
}

void startGameWhenPlayer1Turn(){
  omi=newGameWhenPlayer1Trump();
}

List<playingcard> cardHand(List<int> values) {
  List<playingcard> cardsForPlayer = [];
  for (int i = 0; i < values.length; i++) {
    cardsForPlayer.add(CardNotations(values[i],true));
  }
  return cardsForPlayer;
}

List<playingcard> player1First4Cards(List<int> values) {
  List<playingcard> cardsForPlayer = [];
  for (int i = 0; i < values.length; i++) {
    cardsForPlayer.add(CardNotations(values[i],false));
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
          if(userPermissionNeed==1){
            omi.setPlayer1cardValue(value[i]);
          }
          onTapCallback();
        },
      ),
    );
  }
  return cardsForPlayer;
}

int getCardValue(int value){
  print("card value is : $value");
  return value;
}

FlatCardFan createCardHand(List<int>values) {
  return FlatCardFan(children: cardHand(values));
}
FlatCardFan createCardHandForTrumpSelection(List<int>values) {
  return FlatCardFan(children: player1First4Cards(values));
}
FlatCardFan createGCardHand(List<int> values,VoidCallback onTapCallback) {
  return FlatCardFan(children: GcardHand(values,onTapCallback));
}

FlatCardFan createCardHandForPlayer1(VoidCallback onTapCallback){
  FlatCardFan cardHand = createGCardHand(omi.getPlayer1Cards(),onTapCallback);
  return cardHand;
}

FlatCardFan createCardHandForPlayer1FirstFourCards(){
  FlatCardFan cardHand = createCardHandForTrumpSelection(omi.getPlayer1FirstCards());
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
    return const Text("");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==1){
        player1Index=i;
      }
    }
    if(player1Index+1>table.length){
      return const Text("");
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
    return const Text("");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==2){
        player1Index=i;
      }
    }
    if(player1Index+1>table.length){
      return const Text("");
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
    return const Text("");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==3){
        player1Index=i;
      }
    }
    if(player1Index+1>table.length){
      return const Text("");
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
    return const Text("");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==4){
        player1Index=i;
      }
    }
    if(player1Index+1>table.length){
      return const Text("");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
  }
}

Widget trumpShape(){
  int trump=omi.getTrump();
  Widget widget ;
  if(trump==1){
    widget =  const Image(image:AssetImage("assets/spades.png"));
  }else if(trump == 2){
    widget=const Image(image:AssetImage("assets/heart.png"));
  }else if (trump ==3){
    widget=const Image(image:AssetImage("assets/clubs.png"));
  }else if(trump==4){
    widget=const Image(image:AssetImage("assets/diamond.png"));
  }
  else{
    widget=const Text("");
  }
  return widget;
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
  return Text("$points",style: KteamStyle,);
}
Text team2Points(){
  int points =omi.getPointOfTeam2();
  return Text("$points",style: KteamStyle,);
}

int getBeginner(){
  return omi.getBeginner();
}

void userPermission(){
  print("<<<Player1 permission is set>>>");
  omi.setPlayer1Permission(1);
}

int throwPlayer1CardWithTheTap() {
  int returnvalue=0;
  int value = omi.getPlayer1CardValue();
  omi.throwPlayer1CardManually(value);
  if(omi.userBreakTheRule==1){
    returnvalue=1;
  }
  print("<<screenFunctions.dart throw player1 card with tap");
  return returnvalue;
}

void setTrumpManuallyWhenUserSelect(int value){
  omi.setTrumpManulay(value);
}

Text findTheWinningTeam(){
  late Text text;
  int pointsOfTeam1 = omi.getPointOfTeam1();
  int pointsOfTeam2 = omi.getPointOfTeam2();
  if(beginnerOfTheTurn==1||beginnerOfTheTurn==3){
    if(pointsOfTeam1>pointsOfTeam2){
      print("Team 1 won the Turn");
      text=const Text("We won the turn\nget 1 counting card");
      team2.reduce1CountingCard();
    }else if(pointsOfTeam1 <pointsOfTeam2){
      text =const Text("We lose the turn\ngive 2 counting card");
      team1.reduce2CountingCards();
      print("Team 2 won the Turn");
    }else{
      print("Turn is tied");
      text = const Text("Tie ");
    }
  }else{
    if(pointsOfTeam1>pointsOfTeam2){
      print("Team 1 won the Turn");
      text=const Text("We won the turn\nget 2 counting cards");
      team2.reduce2CountingCards();
    }else if(pointsOfTeam1 <pointsOfTeam2){
      text =const Text("We lose the turn\ngive 1 counting card");
      team1.reduce1CountingCard();
      print("Team 2 won the Turn");
    }else{
      print("Turn is tied");
      text = const Text("Tie ");
    }
  }
  print("Team 1 counting cards : ${team1.getCountingCards()}");
  print("Team 2 counting cards : ${team2.getCountingCards()}");
  return text;
}

Widget CreateCountingCardsForTeam1(){
  late Row row ;
  int cardCount = team1.getCountingCards();
  if(cardCount==1){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==2){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==3){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==4){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if(cardCount==5){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else{
    return Text("cards finished");
  }
  return row;
}

Widget CreateCountingCardsForTeam2(){
  late Row row ;
  int cardCount = team2.getCountingCards();
  if(cardCount==1){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==2){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==3){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if (cardCount==4){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else if(cardCount==5){
    row= Row(
      children: [
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
        Container(
          height: 30,
          child: PlayingCardView(
            card: PlayingCard(Suit.diamonds, CardValue.ace),
            showBack: true,
            elevation: 1,
            shape: shape1,
          ),
        ),
      ],
    );
  }else{
    return Text("cards finished");
  }
  return row;
}

void checkGameTerminate(){
  if(team1.getCountingCards()<=0||team2.getCountingCards()<=0){
    terminateGame=1;
    print("Terminate Game");
  }
}

void playAgain(){
  team1.resetCountingCards();
  team2.resetCountingCards();
  terminateGame=0;
  gameTurn =1;
  startGameWhenPlayer1Turn();
}

void terminateGameWhenUserBreakRules(){
  team1.detect3Cards();
}

