class Team {
  int _countingCards = 5;
  Team();
  void resetCountingCards(){
    _countingCards=1;
  }

  int getCountingCards() {
    return _countingCards;
  }
  void reduce1CountingCard(){
    _countingCards--;
  }
  void reduce2CountingCards(){
    _countingCards=_countingCards-2;
  }
  void detect3Cards(){
    _countingCards=_countingCards-3;
  }
}
