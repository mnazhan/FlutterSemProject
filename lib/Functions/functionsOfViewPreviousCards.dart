import 'package:flutter/material.dart';
import '../cardnotations.dart';
import '../cards.dart';
import '../screencardfunctions.dart';

Widget createCardForRoundsOfPlayer1(int round){
  late List<int> turn;
  late List<int> table;
  if(round==1){
    turn = omi.getRound1Turn();
    table= omi.getRound1();
  }else if(round==2){
    turn = omi.getRound2Turn();
    table= omi.getRound2();
  }else if(round==3){
    turn = omi.getRound3Turn();
    table= omi.getRound3();
  }else if(round==4){
    turn = omi.getRound4Turn();
    table= omi.getRound4();
  }else if (round==5){
    turn = omi.getRound5Turn();
    table= omi.getRound5();
  }else if(round ==6){
    turn = omi.getRound6Turn();
    table= omi.getRound6();
  }else if(round ==7){
    turn = omi.getRound7Turn();
    table= omi.getRound7();
  }else if(round==8){
    turn = omi.getRound8Turn();
    table= omi.getRound8();
  }else{
    print("<<<<Round is not correct >>>>");
  }
  int player1Index=-1;
  if (table.length==0){
    return const Text("<<Round is not Completed>>");
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
Widget createCardForRoundsOfPlayer2(int round){
  late List<int> turn;
  late List<int> table;
  if(round==1){
    turn = omi.getRound1Turn();
    table= omi.getRound1();
  }else if(round==2){
    turn = omi.getRound2Turn();
    table= omi.getRound2();
  }else if(round==3){
    turn = omi.getRound3Turn();
    table= omi.getRound3();
  }else if(round==4){
    turn = omi.getRound4Turn();
    table= omi.getRound4();
  }else if (round==5){
    turn = omi.getRound5Turn();
    table= omi.getRound5();
  }else if(round ==6){
    turn = omi.getRound6Turn();
    table= omi.getRound6();
  }else if(round ==7){
    turn = omi.getRound7Turn();
    table= omi.getRound7();
  }else if(round==8){
    turn = omi.getRound8Turn();
    table= omi.getRound8();
  }else{
    print("<<<<Round is not correct >>>>");
  }
  int player1Index=-1;
  if (table.length==0){
    return const Text("<<Round is not Completed>>");
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
Widget createCardForRoundsOfPlayer3(int round){
  late List<int> turn;
  late List<int> table;
  if(round==1){
    turn = omi.getRound1Turn();
    table= omi.getRound1();
  }else if(round==2){
    turn = omi.getRound2Turn();
    table= omi.getRound2();
  }else if(round==3){
    turn = omi.getRound3Turn();
    table= omi.getRound3();
  }else if(round==4){
    turn = omi.getRound4Turn();
    table= omi.getRound4();
  }else if (round==5){
    turn = omi.getRound5Turn();
    table= omi.getRound5();
  }else if(round ==6){
    turn = omi.getRound6Turn();
    table= omi.getRound6();
  }else if(round ==7){
    turn = omi.getRound7Turn();
    table= omi.getRound7();
  }else if(round==8){
    turn = omi.getRound8Turn();
    table= omi.getRound8();
  }else{
    print("<<<<Round is not correct >>>>");
  }
  int player1Index=-1;
  if (table.length==0){
    return const Text("<<Round is not Completed>>");
  }else{
    for(int i=0;i<turn.length;i++){
      if(turn[i]==3){
        player1Index=i;
      }
    }
    if(player1Index+1>table.length){
      return const Text("<<Round is not Completed>>");
    }else{
      playingcard card = CardNotations(table[player1Index], false);
      return card;
    }
  }
}
Widget createCardForRoundsOfPlayer4(int round){
  late List<int> turn;
  late List<int> table;
  if(round==1){
    turn = omi.getRound1Turn();
    table= omi.getRound1();
  }else if(round==2){
    turn = omi.getRound2Turn();
    table= omi.getRound2();
  }else if(round==3){
    turn = omi.getRound3Turn();
    table= omi.getRound3();
  }else if(round==4){
    turn = omi.getRound4Turn();
    table= omi.getRound4();
  }else if (round==5){
    turn = omi.getRound5Turn();
    table= omi.getRound5();
  }else if(round ==6){
    turn = omi.getRound6Turn();
    table= omi.getRound6();
  }else if(round ==7){
    turn = omi.getRound7Turn();
    table= omi.getRound7();
  }else if(round==8){
    turn = omi.getRound8Turn();
    table= omi.getRound8();
  }else{
    print("<<<<Round is not completed >>>>");
  }
  int player1Index=-1;
  if (table.length==0){
    return const Text("<<Round is not Completed>>");
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
