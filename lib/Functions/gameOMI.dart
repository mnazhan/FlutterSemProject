import 'dart:math';
import 'package:cardgame/Functions/player.dart';

class Game {
  late List<int> _cardDec;
  Player _player1 = Player();
  Player _player2 = Player();
  Player _player3 = Player();
  Player _player4 = Player();
  List<int> _Table = [];
  List<int> _Round1 = [];
  List<int> _Round2 = [];
  List<int> _Round3 = [];
  List<int> _Round4 = [];
  List<int> _Round5 = [];
  List<int> _Round6 = [];
  List<int> _Round7 = [];
  List<int> _Round8 = [];
  List<int> _round1Turn =[];
  List<int> _round2Turn =[];
  List<int> _round3Turn =[];
  List<int> _round4Turn =[];
  List<int> _round5Turn =[];
  List<int> _round6Turn =[];
  List<int> _round7Turn =[];
  List<int> _round8Turn =[];
  int _Trump=0;
  int _Round = 1;
  int _team1Point = 0; //Player 1 and Player 3
  int _team2Point = 0; //Player 2 and Player 4
  int _beginner = 1;
  List<int> _turn = [1, 2, 3, 4];
  int _player1Permission = 0;
  int _player1CardValue =0;

  Game() {
    setCardDec();
    setPlayersCards();
    // setTrump();
  }
  void setCardDec() {
    int count = 32; //decsize
    int min = 1;
    int max = 33;
    if (count > max - min || count < 0) {
      throw ArgumentError('Invalid range or count');
    }
    Set<int> uniqueNumbers = {}; // Using {} to create an empty set
    Random random = Random();
    while (uniqueNumbers.length < count) {
      uniqueNumbers.add(min + random.nextInt(max - min));
    }
    _cardDec = uniqueNumbers.toList();
  }
  void setPlayer1Permission(int value){
    _player1Permission=value;
  }
  int getPlayer1Permission(){
    return _player1Permission;
  }
  void setBeginner(int value) {
    _beginner = value;
  }
  void setPlayer1cardValue (int value){
    _player1CardValue=value;
  }
  int getPlayer1CardValue(){
    return _player1CardValue;
  }
  void resetPlayer1CardValue(){
    _player1CardValue=0;
    print("Player 1 card value : $_player1CardValue");
  }

  int getBeginner() {
    return _beginner;
  }

  void setTurn(int value) {
    //1-Player1 2-Player2   3-Player3   4-Player4
    if (value == 1) {
      _turn = [1, 2, 3, 4];
    } else if (value == 2) {
      _turn = [2, 3, 4, 1];
    } else if (value == 3) {
      _turn = [3, 4, 1, 2];
    } else if (value == 4) {
      _turn = [4, 1, 2, 3];
    } else {
      print("error while finding winner");
    }
  }

  List<int> getTurn() {
    return _turn;
  }

  void addPointToTeam1() {
    _team1Point++;
  }

  int getPointOfTeam1() {
    return _team1Point;
  }

  void addPointToTeam2() {
    _team2Point++;
  }

  int getPointOfTeam2() {
    return _team2Point;
  }

  void increaseRound() {
    _Round++;
  }

  int getRound() {
    return _Round;
  }

  List<int> getCardDec() {
    return _cardDec;
  }

  void setTable(int value) {
    if (_Table.length < 5) {
      _Table.add(value);
    }
  }

  List<int> getTable() {
    return _Table;
  }

  void clearTable() {
    _Table = [];
  }

  void setRound1() {
    _Round1 = _Table;
    _round1Turn=_turn;
  }

  List<int> getRound1Turn(){
    return _round1Turn;
  }
  List<int> getRound2Turn(){
    return _round2Turn;
  }
  List<int> getRound3Turn(){
    return _round3Turn;
  }
  List<int> getRound4Turn(){
    return _round4Turn;
  }
  List<int> getRound5Turn(){
    return _round5Turn;
  }
  List<int> getRound6Turn(){
    return _round6Turn;
  }
  List<int> getRound7Turn(){
    return _round7Turn;
  }
  List<int> getRound8Turn(){
    return _round8Turn;
  }

  List<int> getRound1() {
    return _Round1;
  }

  void setRound2() {
    _Round2 = _Table;
    _round2Turn=_turn;
  }

  List<int> getRound2() {
    return _Round2;
  }

  void setRound3() {
    _Round3 = _Table;
    _round3Turn=_turn;
  }

  List<int> getRound3() {
    return _Round3;
  }

  void setRound4() {
    _Round4 = _Table;
    _round4Turn=_turn;
  }

  List<int> getRound4() {
    return _Round4;
  }

  void setRound5() {
    _Round5 = _Table;
    _round5Turn=_turn;
  }

  List<int> getRound5() {
    return _Round5;
  }

  void setRound6() {
    _Round6 = _Table;
    _round6Turn=_turn;
  }

  List<int> getRound6() {
    return _Round6;
  }

  void setRound7() {
    _Round7 = _Table;
    _round7Turn=_turn;
  }

  List<int> getRound7() {
    return _Round7;
  }

  void setRound8() {
    _Round8 = _Table;
    _round8Turn=_turn;
  }

  List<int> getRound8() {
    return _Round8;
  }

  void setTrumpManulay(int value){
    _Trump=value;
  }

  void setTrump() {
    Random random = Random();
    List<int> FourCards = [];
    List<int> cardSuitCount = [
      0,
      0,
      0,
      0
    ]; // 0- spade 1-heart 2-clubs 3-diamonds
    if (_Round == 1 || _Round == 5) {
      FourCards = getPlayer1FirstCards();
    } else if (_Round == 2 || _Round == 6) {
      FourCards = getPlayer2Cards();
    } else if (_Round == 3 || _Round == 7) {
      FourCards = getPlayer3Cards();
    } else if (_Round == 4 || _Round == 8) {
      FourCards = getPlayer4Cards();
    } else {
      print("Error on Trup setting on rounds");
    }
    for (int i = 0; i < 4; i++) {
      if (FourCards[i] > 0 && FourCards[i] < 9) {
        cardSuitCount[0]++;
      } else if (FourCards[i] > 8 && FourCards[i] < 17) {
        cardSuitCount[1]++;
      } else if (FourCards[i] > 16 && FourCards[i] < 25) {
        cardSuitCount[2]++;
      } else if (FourCards[i] > 24 && FourCards[i] < 33) {
        cardSuitCount[3]++;
      }
    }
    // print("Trup selection Spades : ${cardSuitCount[0]}");
    // print("Trup selection Heart : ${cardSuitCount[1]}");
    // print("Trup selection Clubs : ${cardSuitCount[2]}");
    // print("Trup selection Diamond : ${cardSuitCount[3]}");
    int firstMaxIndex = 0;
    int secondMaxIndex = -1;

    for (int i = 1; i < cardSuitCount.length; i++) {
      if (cardSuitCount[i] > cardSuitCount[firstMaxIndex]) {
        secondMaxIndex = firstMaxIndex;
        firstMaxIndex = i;
      } else if (secondMaxIndex == -1) {
        secondMaxIndex = i;
      } else if (secondMaxIndex != -1) {
        if (cardSuitCount[i] > cardSuitCount[secondMaxIndex]) {
          secondMaxIndex = i;
        }
      }
    }
    if (cardSuitCount[firstMaxIndex] == 4 ||
        cardSuitCount[firstMaxIndex] == 3) {
      if (firstMaxIndex == 0) {
        _Trump = 1;
      } else if (firstMaxIndex == 1) {
        _Trump = 2;
      } else if (firstMaxIndex == 2) {
        _Trump = 3;
      } else if (firstMaxIndex == 3) {
        _Trump = 4;
      } else {
        print("error in trup selection");
      }
    } else if (cardSuitCount[firstMaxIndex] == 2) {
      if (cardSuitCount[secondMaxIndex] == 1) {
        if (firstMaxIndex == 0) {
          _Trump = 1;
        } else if (firstMaxIndex == 1) {
          _Trump = 2;
        } else if (firstMaxIndex == 2) {
          _Trump = 3;
        } else if (firstMaxIndex == 3) {
          _Trump = 4;
        } else {
          print("error in trup selection");
        }
      } else if (cardSuitCount[secondMaxIndex] == 2) {
        int randomNumber = random.nextInt(2) + 1;
        if (randomNumber == 1) {
          if (firstMaxIndex == 0) {
            _Trump = 1;
          } else if (firstMaxIndex == 1) {
            _Trump = 2;
          } else if (firstMaxIndex == 2) {
            _Trump = 3;
          } else if (firstMaxIndex == 3) {
            _Trump = 4;
          } else {
            print("error in trup selection");
          }
        } else {
          if (secondMaxIndex == 0) {
            _Trump = 1;
          } else if (secondMaxIndex == 1) {
            _Trump = 2;
          } else if (secondMaxIndex == 2) {
            _Trump = 3;
          } else if (secondMaxIndex == 3) {
            _Trump = 4;
          } else {
            print("error in trup selection");
          }
        }
      }
    } else {
      int randomNumber = random.nextInt(4) + 1;
      if (randomNumber == 1) {
        _Trump = 1;
      } else if (randomNumber == 2) {
        _Trump = 2;
      } else if (randomNumber == 3) {
        _Trump = 3;
      } else if (randomNumber == 4) {
        _Trump = 4;
      } else {
        print("error while max index value is 1");
      }
    }
  }

  int getTrump() {
    return _Trump;
  }

  void setPlayersCards() {
    List<int> list1 = [];
    List<int> list2 = [];
    List<int> list3 = [];
    List<int> list4 = [];
    for (int i = 0; i < 32; i++) {
      if (i < 8) {
        list1.add(_cardDec[i]);
      } else if (i < 16) {
        list2.add(_cardDec[i]);
      } else if (i < 24) {
        list3.add(_cardDec[i]);
      } else {
        list4.add(_cardDec[i]);
      }
    }
    _player1.setCards(list1);
    _player2.setCards(list2);
    _player3.setCards(list3);
    _player4.setCards(list4);
  }

  List<int> getPlayer1Cards() {
    return _player1.getCards();
  }

  List<int> getPlayer2Cards() {
    return _player2.getCards();
  }

  List<int> getPlayer3Cards() {
    return _player3.getCards();
  }

  List<int> getPlayer4Cards() {
    return _player4.getCards();
  }

  void setPlayer1Cards(List<int> values) {
    _player1.setCards(values);
  }

  void setPlayer2Cards(List<int> values) {
    _player2.setCards(values);
  }

  void setPlayer3Cards(List<int> values) {
    _player3.setCards(values);
  }

  void setPlayer4Cards(List<int> values) {
    _player4.setCards(values);
  }

  List<int> getPlayer1FirstCards() {
    return _player1.getFirstFourCards();
  }

  List<int> getPlayer2FirstCards() {
    return _player2.getFirstFourCards();
  }

  List<int> getPlayer3FirstCards() {
    return _player3.getFirstFourCards();
  }

  List<int> getPlayer4FirstCards() {
    return _player4.getFirstFourCards();
  }

  List<int> throwStartCard(List<int> cards) {
    Random random = Random();
    int removeValue = -1;
    late int removeIndex;
    late List<int> updatedCards;
    for (int i = 0; i < cards.length; i++) {
      if (cards[i] == 1) {
        //spades ace
        removeValue = 1;
        removeIndex = i;
        break;
      } else if (cards[i] == 9) {
        //heart ace
        removeValue = 9;
        removeIndex = i;
        break;
      } else if (cards[i] == 17) {
        //clubs ace
        removeValue = 17;
        removeIndex = i;
        break;
      } else if (cards[i] == 25) {
        //Diamond ace
        removeValue = 25;
        removeIndex = i;
        break;
      }
    }
    if (removeValue == -1) {
      removeIndex = random.nextInt(cards.length);
    }
    setTable(cards[removeIndex]);
    cards.remove(cards[removeIndex]);
    updatedCards = cards;
    return updatedCards;
  }

  List<int> throwSecondCard(List<int> cards) {
    late int removeValue = -1;
    late List<int> updatedCards;
    late int FirstCardKindom;
    List<int> card1Values = [];
    List<int> card2Values = [];
    List<int> card3Values = [];
    List<int> card4Values = [];

    int FirstCardOfTheRound = _Table[0];
    if (FirstCardOfTheRound > 0 && FirstCardOfTheRound < 9) {
      FirstCardKindom = 1; //Spade
    } else if (FirstCardOfTheRound > 8 && FirstCardOfTheRound < 17) {
      FirstCardKindom = 2; //Heart
    } else if (FirstCardOfTheRound > 16 && FirstCardOfTheRound < 25) {
      FirstCardKindom = 3; //Clubs
    } else if (FirstCardOfTheRound > 24 && FirstCardOfTheRound < 33) {
      FirstCardKindom = 4; //Diamond
    } else {
      print("first card kindom finding error ");
      FirstCardKindom = -1;
    }
    // print("first card kindom of the table : $FirstCardKindom");
    for (int i = 0; i < cards.length; i++) {
      if (cards[i] > 0 && cards[i] < 9) {
        card1Values.add(cards[i]);
      } else if (cards[i] > 8 && cards[i] < 17) {
        card2Values.add(cards[i]);
      } else if (cards[i] > 16 && cards[i] < 25) {
        card3Values.add(cards[i]);
      } else if (cards[i] > 24 && cards[i] < 33) {
        card4Values.add(cards[i]);
      }
    }
    // int numSpade= card1Values.length;
    // int numHeart= card2Values.length;
    // int numClubs= card3Values.length;
    // int numDiamond= card4Values.length;
    // print("Spade cards : $numSpade");
    // print("Heart cards : $numHeart");
    // print("Clubs cards : $numClubs");
    // print("Diamond cards : $numDiamond");

    card1Values.sort();
    card2Values.sort();
    card3Values.sort();
    card4Values.sort();
    List<int> suitLength = [
      card1Values.length,
      card2Values.length,
      card3Values.length,
      card4Values.length
    ];
    // print("suitlenth : ");
    // print(suitLength);
    int largeIndex = 0; //0-spaid 1-heart 2-clubs 3-diamond
    int largeValue = suitLength[0];
    for (int i = 1; i < 4; i++) {
      if (largeValue < suitLength[i]) {
        largeValue = suitLength[i];
        largeIndex = i;
      }
    }
    // print("Max number of card : $largeValue");
    // print("Max number card index : $largeIndex");
    if (FirstCardKindom == 1) {
      if (card1Values.length != 0) {
        if (card1Values[0] < _Table[0]) {
          removeValue = card1Values[0];
        } else {
          removeValue = card1Values.last;
        }
      } else {
        if (getTrump() == 1) {
          if (largeIndex == 1) {
            removeValue = card2Values.last;
          } else if (largeIndex == 2) {
            removeValue = card3Values.last;
          } else if (largeIndex == 3) {
            removeValue = card4Values.last;
          }
        } else if (getTrump() == 2) {
          if (card2Values.length != 0) {
            removeValue = card2Values.last;
          } else {
            if (largeIndex == 2) {
              removeValue = card2Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 3) {
          if (card3Values.length != 0) {
            removeValue = card3Values.last;
          } else {
            if (largeIndex == 1) {
              removeValue = card2Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 4) {
          if (card4Values.length != 0) {
            removeValue = card4Values.last;
          } else {
            if (largeIndex == 1) {
              removeValue = card2Values.last;
            } else if (largeIndex == 2) {
              removeValue = card4Values.last;
            }
          }
        }
      }
    } //spade
    else if (FirstCardKindom == 2) {
      if (card2Values.length != 0) {
        if (card2Values[0] < _Table[0]) {
          removeValue = card2Values[0];
        } else {
          removeValue = card2Values.last;
        }
      } else {
        if (getTrump() == 1) {
          if (card1Values.length != 0) {
            removeValue = card1Values.last;
          } else {
            if (largeIndex == 2) {
              removeValue = card3Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 2) {
          if (largeIndex == 0) {
            removeValue = card1Values.last;
          } else if (largeIndex == 2) {
            removeValue = card3Values.last;
          } else if (largeIndex == 3) {
            removeValue = card4Values.last;
          }
        } else if (getTrump() == 3) {
          if (card3Values.length != 0) {
            removeValue = card3Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 4) {
          if (card4Values.length != 0) {
            removeValue = card4Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 2) {
              removeValue = card3Values.last;
            }
          }
        }
      }
    } //heart
    else if (FirstCardKindom == 3) {
      //clubs
      if (card3Values.length != 0) {
        if (card3Values[0] < _Table[0]) {
          removeValue = card3Values[0];
        } else {
          removeValue = card3Values.last;
        }
      } else {
        if (getTrump() == 1) {
          if (card1Values.length != 0) {
            removeValue = card1Values.last;
          } else {
            if (largeIndex == 1) {
              removeValue = card2Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 2) {
          if (card2Values.length != 0) {
            removeValue = card2Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 3) {
              removeValue = card4Values.last;
            }
          }
        } else if (getTrump() == 3) {
          if (largeIndex == 0) {
            removeValue = card1Values.last;
          } else if (largeIndex == 1) {
            removeValue = card2Values.last;
          } else if (largeIndex == 3) {
            removeValue = card4Values.last;
          }
        } else if (getTrump() == 4) {
          if (card4Values.length != 0) {
            removeValue = card4Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 1) {
              removeValue = card2Values.last;
            }
          }
        }
      }
    } //clubs
    else if (FirstCardKindom == 4) {
      //Diamond
      if (card4Values.length != 0) {
        if (card4Values[0] < _Table[0]) {
          removeValue = card4Values[0];
        } else {
          removeValue = card4Values.last;
        }
      } else {
        if (getTrump() == 1) {
          if (card1Values.length != 0) {
            removeValue = card1Values.last;
          } else {
            if (largeIndex == 1) {
              removeValue = card2Values.last;
            } else if (largeIndex == 2) {
              removeValue = card3Values.last;
            }
          }
        } else if (getTrump() == 2) {
          if (card2Values.length != 0) {
            removeValue = card2Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 2) {
              removeValue = card3Values.last;
            }
          }
        } else if (getTrump() == 3) {
          if (card3Values.length != 0) {
            removeValue = card3Values.last;
          } else {
            if (largeIndex == 0) {
              removeValue = card1Values.last;
            } else if (largeIndex == 1) {
              removeValue = card2Values.last;
            }
          }
        } else if (getTrump() == 4) {
          if (largeIndex == 0) {
            removeValue = card1Values.last;
          } else if (largeIndex == 1) {
            removeValue = card2Values.last;
          } else if (largeIndex == 2) {
            removeValue = card3Values.last;
          }
        }
      }
    } else {
      print("Error finding second card ");
    }
    setTable(removeValue);
    cards.remove(removeValue);
    updatedCards = cards;
    return updatedCards;
  }

  void throwPlayer1CardManually(int value) {
    List<int> player1CardHand = getPlayer1Cards();
    List<int> card1Values = [];
    List<int> card2Values = [];
    List<int> card3Values = [];
    List<int> card4Values = [];
    late int FirstCardKindom;
    late int valueKind;
    if(_Table.length==0){
      setTable(value);
      player1CardHand.remove(value);
    }else{
      for (int i = 0; i < player1CardHand.length; i++) {
        if (player1CardHand[i] > 0 && player1CardHand[i] < 9) {
          card1Values.add(player1CardHand[i]);
        } else if (player1CardHand[i] > 8 && player1CardHand[i] < 17) {
          card2Values.add(player1CardHand[i]);
        } else if (player1CardHand[i] > 16 && player1CardHand[i] < 25) {
          card3Values.add(player1CardHand[i]);
        } else if (player1CardHand[i] > 24 && player1CardHand[i] < 33) {
          card4Values.add(player1CardHand[i]);
        }
      }
      int FirstCardOfTheRound = _Table[0];
      FirstCardKindom = getValueKindom(FirstCardOfTheRound);
      valueKind = getValueKindom(value);
      if (FirstCardKindom==valueKind){
        setTable(value);
        player1CardHand.remove(value);
      }else{
        late int valueKindCardNo;
        if(valueKind == 1){
          valueKindCardNo=card1Values.length;
        }else if(valueKind==2){
          valueKindCardNo=card2Values.length;
        }else if(valueKind==3){
          valueKindCardNo=card3Values.length;
        }else {
          valueKindCardNo=card4Values.length;
        }
        if(valueKindCardNo==0){
          setTable(value);
          player1CardHand.remove(value);
        }else{
          print("<<<choose an acceptable card>>>");
          setTable(value);
          player1CardHand.remove(value);
          // resetPlayer1CardValue();
          // setPlayer1Permission(0);
        }
      }
    }
    setPlayer1Cards(player1CardHand);
  }

  int getValueKindom(int value){
    late int kindom;
    if (value > 0 && value < 9) {
      kindom = 1; //Spade
    } else if (value > 8 && value < 17) {
      kindom = 2; //Heart
    } else if (value > 16 && value < 25) {
      kindom = 3; //Clubs
    } else if (value > 24 && value < 33) {
      kindom = 4; //Diamond
    } else {
      print("first card kindom finding error in throw player 1 card manually faction gameOMI.dart");
      kindom = -1;
    }
    return kindom;
  }

  void findTheWinner(List<int> value) {
    int largeValue = value[0];
    int largeIndex = 0;
    if (value[0] > 0 && value[0] < 9) {
      for (int i = 1; i < 4; i++) {
        if (value[i] > 0 && value[i] < 9) {
          if (largeValue > value[i]) {
            largeValue = value[i];
            largeIndex = i;
          }
        } else {
          int trump = getTrump();
          if (trump == 2) {
            if (value[i] > 8 && value[i] < 17) {
              if (largeValue > 8 && largeValue < 17) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 3) {
            if (value[i] > 16 && value[i] < 25) {
              if (largeValue > 16 && largeValue < 25) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 4) {
            if (value[i] > 24 && value[i] < 33) {
              if (largeValue > 24 && largeValue < 33) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          }
        }
      }
    } else if (value[0] > 8 && value[0] < 17) {
      for (int i = 1; i < 4; i++) {
        if (value[i] > 8 && value[i] < 17) {
          if (largeValue > value[i]) {
            largeValue = value[i];
            largeIndex = i;
          }
        } else {
          int trump = getTrump();
          if (trump == 1) {
            if (value[i] > 0 && value[i] < 9) {
              if (largeValue > 0 && largeValue < 9) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 3) {
            if (value[i] > 16 && value[i] < 25) {
              if (largeValue > 16 && largeValue < 25) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 4) {
            if (value[i] > 24 && value[i] < 33) {
              if (largeValue > 24 && largeValue < 33) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          }
        }
      }
    } else if (value[0] > 16 && value[0] < 25) {
      for (int i = 1; i < 4; i++) {
        if (value[i] > 16 && value[i] < 25) {
          if (largeValue > value[i]) {
            largeValue = value[i];
            largeIndex = i;
          }
        } else {
          int trump = getTrump();
          if (trump == 1) {
            if (value[i] > 0 && value[i] < 9) {
              if (largeValue > 0 && largeValue < 9) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 2) {
            if (value[i] > 8 && value[i] < 17) {
              if (largeValue > 8 && largeValue < 17) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 4) {
            if (value[i] > 24 && value[i] < 33) {
              if (largeValue > 24 && largeValue < 33) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          }
        }
      }
    } else if (value[0] > 24 && value[0] < 33) {
      for (int i = 1; i < 4; i++) {
        if (value[i] > 24 && value[i] < 33) {
          if (largeValue > value[i]) {
            largeValue = value[i];
            largeIndex = i;
          }
        } else {
          int trump = getTrump();
          if (trump == 1) {
            if (value[i] > 0 && value[i] < 9) {
              if (largeValue > 0 && largeValue < 9) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 2) {
            if (value[i] > 8 && value[i] < 17) {
              if (largeValue > 8 && largeValue < 17) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          } else if (trump == 3) {
            if (value[i] > 16 && value[i] < 25) {
              if (largeValue > 16 && largeValue < 25) {
                if (largeValue > value[i]) {
                  largeValue = value[i];
                  largeIndex = i;
                }
              } else {
                largeValue = value[i];
                largeIndex = i;
              }
            }
          }
        }
      }
    } else {
      print("eror in table values ");
    }

    List<int> currentTurn = getTurn();
    int winingPlayer = currentTurn[largeIndex];

    if (winingPlayer == 1 || winingPlayer == 3) {
      addPointToTeam1();
    } else {
      addPointToTeam2();
    }
    setBeginner(winingPlayer);
    setTurn(winingPlayer);

    //save table into rounds records
    if (getRound() == 1) {
      setRound1();
    } else if (getRound() == 2) {
      setRound2();
    } else if (getRound() == 3) {
      setRound3();
    } else if (getRound() == 4) {
      setRound4();
    } else if (getRound() == 5) {
      setRound5();
    } else if (getRound() == 6) {
      setRound6();
    } else if (getRound() == 7) {
      setRound7();
    } else {
      setRound8();
    }
    resetPlayer1CardValue();
    increaseRound();
    clearTable();
    setPlayer1Permission(0);
    // increaseRound();
  }

  void runRoundAutomatically() {
    List<int> updatedCard1 = [];
    List<int> updatedCard2 = [];
    List<int> updatedCard3 = [];
    List<int> updatedCard4 = [];
    do {
      int gameOrder = getBeginner();
      int round = getRound();
      print("-------------------------Round $round------------------");
      print("--------Player 1 ----------");
      print(getPlayer1Cards());
      print("--------Player 2 ----------");
      print(getPlayer2Cards());
      print("--------Player 3 ----------");
      print(getPlayer3Cards());
      print("--------Player 4 ----------");
      print(getPlayer4Cards());
      // setTrump();
      if (gameOrder == 1) {
        // print("-----------first 4 cards of Player 1 ----------");
        // print(getPlayer1FirstCards());
        updatedCard1 = throwStartCard(getPlayer1Cards());
        setPlayer1Cards(updatedCard1);
        updatedCard2 = throwSecondCard(getPlayer2Cards());
        setPlayer2Cards(updatedCard2);
        updatedCard3 = throwSecondCard(getPlayer3Cards());
        setPlayer3Cards(updatedCard3);
        updatedCard4 = throwSecondCard(getPlayer4Cards());
        setPlayer4Cards(updatedCard4);
        print("---------Table--------------");
        print(getTable());
        findTheWinner(getTable());
        print("--------Winner-------------");
        print(getBeginner());
        print("----------Team 1 ----------");
        print(getPointOfTeam1());
        print("----------Team 2 ----------");
        print(getPointOfTeam2());
      } else if (gameOrder == 2) {
        // print("-----------first 4 cards of Player 2 ----------");
        // print(getPlayer2FirstCards());
        updatedCard2 = throwStartCard(getPlayer2Cards());
        setPlayer2Cards(updatedCard2);
        updatedCard3 = throwSecondCard(getPlayer3Cards());
        setPlayer3Cards(updatedCard3);
        updatedCard4 = throwSecondCard(getPlayer4Cards());
        setPlayer4Cards(updatedCard4);
        updatedCard1 = throwSecondCard(getPlayer1Cards());
        setPlayer1Cards(updatedCard1);
        print("---------Table--------------");
        print(getTable());
        findTheWinner(getTable());
        print("--------Winner-------------");
        print(getBeginner());
        print("----------Team 1 ----------");
        print(getPointOfTeam1());
        print("----------Team 2 ----------");
        print(getPointOfTeam2());
      } else if (gameOrder == 3) {
        // print("-----------first 4 cards of Player 3 ----------");
        // print(getPlayer3FirstCards());
        updatedCard3 = throwStartCard(getPlayer3Cards());
        setPlayer3Cards(updatedCard3);
        updatedCard4 = throwSecondCard(getPlayer4Cards());
        setPlayer4Cards(updatedCard4);
        updatedCard1 = throwSecondCard(getPlayer1Cards());
        setPlayer1Cards(updatedCard1);
        updatedCard2 = throwSecondCard(getPlayer2Cards());
        setPlayer2Cards(updatedCard2);
        print("---------Table--------------");
        print(getTable());
        findTheWinner(getTable());
        print("--------Winner-------------");
        print(getBeginner());
        print("----------Team 1 ----------");
        print(getPointOfTeam1());
        print("----------Team 2 ----------");
        print(getPointOfTeam2());
      } else if (gameOrder == 4) {
        // print("-----------first 4 cards of Player 4 ----------");
        // print(getPlayer4FirstCards());
        throwStartCard(getPlayer4Cards());
        throwSecondCard(getPlayer1Cards());
        throwSecondCard(getPlayer2Cards());
        throwSecondCard(getPlayer3Cards());
        print("---------Table--------------");
        print(getTable());
        findTheWinner(getTable());
        print("--------Winner-------------");
        print(getBeginner());
        print("----------Team 1 ----------");
        print(getPointOfTeam1());
        print("----------Team 2 ----------");
        print(getPointOfTeam2());
      } else {
        print("Error in gameOMI.dart automatic game function ");
      }
    } while (getRound() < 9);
  }
}
