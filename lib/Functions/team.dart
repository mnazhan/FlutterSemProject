class Team {
  int _countingCards = 5;
  Team();
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
