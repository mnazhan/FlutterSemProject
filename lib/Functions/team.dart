class Team {
  int _countingCards = 1;
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
}
