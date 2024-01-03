import 'package:playing_cards/playing_cards.dart';
import 'package:flutter/material.dart';

ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    side: const BorderSide(color: Colors.black, width: 1));

class playingcard extends StatelessWidget {
  final Suit suit;
  final CardValue cardValue;
  playingcard({required this.suit,required this.cardValue,});

  @override
  Widget build(BuildContext context) {
    return PlayingCardView(
        card: PlayingCard(suit, cardValue),
        showBack: false,
        elevation: 1,
        );
  }
}