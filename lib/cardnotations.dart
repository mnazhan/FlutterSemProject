import 'package:cardgame/cards.dart';
import 'package:playing_cards/playing_cards.dart';

playingcard CardNotations(int value,bool bValue) {
  late playingcard x ;
  // =playingcard(suit: Suit.spades, cardValue: CardValue.joker_1);
  if (value == 1) {
   x = playingcard(suit: Suit.spades, cardValue: CardValue.ace,backFace: bValue,);
  } else if (value == 2) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.king,backFace: bValue);
  } else if (value == 3) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.queen,backFace: bValue);
  } else if (value == 4) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.jack,backFace: bValue);
  } else if (value == 5) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.ten,backFace: bValue);
  } else if (value == 6) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.nine,backFace: bValue);
  } else if (value == 7) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.eight,backFace: bValue);
  } else if (value == 8) {
    x = playingcard(suit: Suit.spades, cardValue: CardValue.seven,backFace: bValue);
  } else if (value == 9) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.ace,backFace: bValue);
  } else if (value == 10) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.king,backFace: bValue);
  } else if (value == 11) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.queen,backFace: bValue);
  } else if (value == 12) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.jack,backFace: bValue);
  } else if (value == 13) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.ten,backFace: bValue);
  } else if (value == 14) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.nine,backFace: bValue);
  } else if (value == 15) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.eight,backFace: bValue);
  } else if (value == 16) {
    x = playingcard(suit: Suit.hearts, cardValue: CardValue.seven,backFace: bValue);
  } else if (value == 17) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.ace,backFace: bValue);
  } else if (value == 18) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.king,backFace: bValue);
  } else if (value == 19) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.queen,backFace: bValue);
  } else if (value == 20) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.jack,backFace: bValue);
  } else if (value == 21) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.ten,backFace: bValue);
  }else if (value == 22) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.nine,backFace: bValue);
  }else if (value == 23) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.eight,backFace: bValue);
  }else if (value == 24) {
    x = playingcard(suit: Suit.clubs, cardValue: CardValue.seven,backFace: bValue);
  }else if (value == 25) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.ace,backFace: bValue);
  } else if (value == 26) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.king,backFace: bValue);
  }else if (value == 27) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.queen,backFace: bValue);
  }else if (value == 28) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.jack,backFace: bValue);
  }else if (value == 29) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.ten,backFace: bValue);
  }else if (value == 30) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.nine,backFace: bValue);
  }else if (value == 31) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.eight,backFace: bValue);
  }else if (value == 32) {
    x = playingcard(suit: Suit.diamonds, cardValue: CardValue.seven,backFace: bValue);
  }
  return x;
}