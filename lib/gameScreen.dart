import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'screencardfunctions.dart';

int hideNextButton = 1;
int hidePlayButton = 0;
int userPermissionNeed =0;

class gamescreen extends StatefulWidget {
  const gamescreen({Key? key}) : super(key: key);

  @override
  State<gamescreen> createState() => _gamescreenState();
}

class _gamescreenState extends State<gamescreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Container(
                    color: Colors.blue,
                    child: Text("Team 1 -"),
                  ),
                  Container(
                    color: Colors.blue,
                    child: team1Points(),
                  )
                ]),
                Row(
                  children: [
                    if (hidePlayButton == 0)
                      FilledButton(
                          child: const Text("Play"),
                          onPressed: () async {
                            setState(() {
                              hidePlayButton = 1;
                            });
                            int beiginnerForTrump = omi.getBeginner();
                            if(beiginnerForTrump==1) {
                              await _dialogBuilderForTrumpSelection(context);
                            }
                            await Future.delayed(const Duration(seconds: 1));
                            for (int i = 0; i < 8; i++) {
                              int beiginner = omi.getBeginner();
                              print("Biginning player: $beiginner");
                              if (beiginner == 1) {
                                // print("game waiting for a user click");
                                userPermissionNeed=1;
                                await waitForPlayer1Permission();
                                await whenTrunIsf1();
                              } else if (beiginner == 2) {
                                await whenTrunIsf2();
                              } else if (beiginner == 3) {
                                await whenTrunIsf3();
                              } else {
                                await whenTrunIsf4();
                              }
                            }
                            Text text=findTheWinningTeam();
                            await _dialogBuilderForWinNote(context,text);
                            setState(() {
                              hideNextButton =0;
                            });
                          }),
                    const SizedBox(
                      width: 5,
                    ),
                    if(hideNextButton==0)
                      FilledButton(
                      child: const Text("Next"),
                      onPressed: () {
                        hideNextButton=1;
                        hidePlayButton=0;
                        setState(() {
                          if(gameTurn==5||gameTurn==9 || gameTurn==13||gameTurn==17){
                            startGameWhenPlayer1Turn();
                          }else{
                            startGame();
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(children: [
                  Container(
                    color: Colors.blue,
                    child: Text("Team 2 -"),
                  ),
                  Container(
                    color: Colors.blue,
                    child: team2Points(),
                  )
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text("Counting cards : 5"),
                ),
                Container(
                  child: Text("Counting cards : 5"),
                ),
                Container(
                  height: 30,
                  child: PlayingCardView(card: PlayingCard(Suit.clubs, CardValue.nine)),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: createCardHandForPlayer3(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.yellow,
                      child: Transform.rotate(
                        angle: 90 * (3.1415926535 / 180),
                        child: createCardHandForPlayer4(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      color: Colors.brown,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              width: double.infinity,
                              child: Center(
                                child: createCardForTableOfPlayer3(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: double.infinity,
                                    color: Colors.yellow,
                                    child: Center(
                                      child: createCardForTableOfPlayer4(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.purple,
                                    height: double.infinity,
                                    child: Center(child: trumpShape()),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.yellow,
                                    height: double.infinity,
                                    child: Center(
                                      child: createCardForTableOfPlayer2(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              width: double.infinity,
                              child: Center(
                                child: createCardForTableOfPlayer1(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      //Player 2
                      height: 100,
                      color: Colors.yellow,
                      child: Transform.rotate(
                        angle: 90 * (3.1415926535 / 180),
                        child: createCardHandForPlayer2(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: createCardHandForPlayer1(
                  () {
                    if(userPermissionNeed==1){
                      userPermission();
                      print("<<Player 1 card is pressed>>");
                      userPermissionNeed =0;
                    }else{
                      print("Wait for your turn");
                      _dialogBuilderForWaitForTurnNote(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your FAB's functionality here
            print('Floating Action Button Pressed');
            Navigator.pushNamed(context, '/second');
          },
          child: Icon(Icons.preview), // You can customize the icon
        ),
      ),
    );
  }

  Future<void> whenTrunIsf1() async {
    setState(() {
      int value = throwPlayer1CardWithTheTap();
      print("player 1 to table : $value");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf2() async {
    setState(() {
      setStartingCardForPlayer2ToTable();
      print("player 2 to table");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 3));
    // print("game wait for user click");
    userPermissionNeed=1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf3() async {
    setState(() {
      setStartingCardForPlayer3ToTable();
      print("player 3 to table");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 3));
    // print("game wait for user click");
    userPermissionNeed=1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf4() async {
    setState(() {
      setStartingCardForPlayer4ToTable();
      print("player 4 to table");
    });
    await Future.delayed(Duration(seconds: 3));
    // print("game wait for user click");
    userPermissionNeed=1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> throwPlayer1CardForTapWithCheck() async {
    int value = throwPlayer1CardWithTheTap();
    while (value != 0) {
      print("inside while");
      await waitForPlayer1Permission();
      print("recall function to throw palyer 1 card  ");
      value = await throwPlayer1CardWithTheTap();
    }
    print("player 1 card");
  }

  Future<void> _dialogBuilderForTrumpSelection(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Trump'),
          content: Container(
            height: 70,
            child: createCardHandForPlayer1FirstFourCards(),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('S'),
              onPressed: () {
                setState(() {
                  setTrumpManuallyWhenUserSelect(1);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('H'),
              onPressed: () {
                setState(() {
                  setTrumpManuallyWhenUserSelect(2);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('C'),
              onPressed: () {
                setState(() {
                  setTrumpManuallyWhenUserSelect(3);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('D'),
              onPressed: () {
                setState(() {
                  setTrumpManuallyWhenUserSelect(4);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilderForUserInputNotification(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select your card'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> waitForPlayer1Permission() async {
    int value =0;
      while (omi.getPlayer1Permission() != 1) {
        if (value==0){
          _dialogBuilderForUserInputNotification(context);
          value++;
        }
        // Simulate waiting for the variable to become 1
        print("game waits for a user input");
        await Future.delayed(const Duration(microseconds: 100));
      }
  }

  Future<void> _dialogBuilderForWinNote(BuildContext context,Text value) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: value,
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _dialogBuilderForWaitForTurnNote(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Wait For your Turn"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
