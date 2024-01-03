import 'package:flutter/material.dart';

class Player {
  late List<int> _Cards;
  Player();
  void setCards(List<int> list) {
    _Cards = list;
  }

  List<int> getCards() {
    return _Cards;
  }

  List<int> getFirstFourCards(){
    List<int> fistCards=[];
    for (int i=0;i<4;i++){
      fistCards.add(_Cards[i]);
    }
    return fistCards;
  }
}
