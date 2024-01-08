import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constans.dart';
import 'screencardfunctions.dart';

int hideNextButton = 1;
int hidePlayButton = 0;
int userPermissionNeed = 0;

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
        body: Container(
          color: const Color(0xFF141E1D),
          child: Column(
            children: [
              Container(
                color: const Color(0xFF446063),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF272D2D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // color: Colors.teal.shade700,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          child: Row(children: [
                            const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "We",
                              style: Kteam,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: team1Points(),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        if (hidePlayButton == 0)
                          FilledButton(
                              style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF272D2D),
                                  elevation: 5),
                              child: const Text(
                                "Play",
                              ),
                              onPressed: () async {
                                setState(() {
                                  hidePlayButton = 1;
                                });
                                int beiginnerForTrump = omi.getBeginner();
                                if (beiginnerForTrump == 1) {
                                  while(omi.getTrump() ==0){
                                    await _dialogBuilderForTrumpSelection(
                                        context);
                                  }
                                }
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                for (int i = 0; i < 8; i++) {
                                  int beiginner = omi.getBeginner();
                                  print("Biginning player: $beiginner");
                                  if (beiginner == 1) {
                                    // print("game waiting for a user click");
                                    userPermissionNeed = 1;
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
                                Text text = findTheWinningTeam();
                                await _dialogBuilderForWinNote(context, text);
                                checkGameTerminate();
                                if (terminateGame == 1) {
                                  if (team1.getCountingCards() < 1) {
                                    _dialogBuilderForFinalNote(context,
                                        const Text("We lost the game"));
                                  } else {
                                    _dialogBuilderForFinalNote(
                                        context, const Text("We won the game"));
                                  }
                                }
                                setState(() {
                                  hideNextButton = 0;
                                });
                              }),
                        const SizedBox(
                          width: 5,
                        ),
                        if (hideNextButton == 0)
                          FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF272D2D),
                                elevation: 5),
                            child: const Text("Next"),
                            onPressed: () {
                              hideNextButton = 1;
                              hidePlayButton = 0;
                              setState(() {
                                if (gameTurn == 5 ||
                                    gameTurn == 9 ||
                                    gameTurn == 13 ||
                                    gameTurn == 17) {
                                  startGameWhenPlayer1Turn();
                                } else {
                                  startGame();
                                }
                              });
                              checkGameTerminate();
                              if (terminateGame == 1) {
                                if (team1.getCountingCards() <= 1) {
                                  _dialogBuilderForFinalNote(
                                      context, const Text("We lost the game"));
                                } else {
                                  _dialogBuilderForFinalNote(
                                      context, const Text("We won the game"));
                                }
                              }
                            },
                          ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF272D2D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5),
                        child: Row(children: [
                          const CircleAvatar(
                            radius: 20,
                            child: Icon(Icons.person),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Others",
                            style: Kteam,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: team2Points(),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCD5DE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 2),
                        child: CreateCountingCardsForTeam1(),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCD5DE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 2),
                        child: CreateCountingCardsForTeam2(),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Player 3",
                  style: KplayerStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF446062),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 110,
                width: 210,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 17, 3),
                  child: createCardHandForPlayer3(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "Player 4",
                              style: KteamStyle,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 110,
                              decoration: BoxDecoration(
                                color: const Color(0xFF446062),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 2, 0, 10),
                                child: Transform.rotate(
                                  angle: 90 * (3.1415926535 / 180),
                                  child: createCardHandForPlayer4(),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: double.infinity,
                        // color: Colors.brown,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                // color: Colors.red,
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
                                      // color: Colors.yellow,
                                      child: Center(
                                        child: createCardForTableOfPlayer4(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: double.infinity,
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFCCD5DE),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: trumpShape(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      // color: Colors.yellow,
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
                                // color: Colors.red,
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
                      child: Column(children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Player 2",
                          style: KteamStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          //Player 2
                          height: 110,
                          decoration: BoxDecoration(
                            color: const Color(0xFF446062),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 10),
                            child: Transform.rotate(
                              angle: 90 * (3.1415926535 / 180),
                              child: createCardHandForPlayer2(),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF446062),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 170,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 40, 5),
                  child: createCardHandForPlayer1(
                    () {
                      if (userPermissionNeed == 1) {
                        userPermission();
                        print("<<Player 1 card is pressed>>");
                        userPermissionNeed = 0;
                      } else {
                        print("Wait for your turn");
                        _dialogBuilderForWaitForTurnNote(context);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "You",
                  style: KplayerStyle,
                ),
              ),
              const SizedBox(
                height: 35,
              )
            ],
          ),
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
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(const Duration(seconds: KwinnigPlayerTime));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf2() async {
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setStartingCardForPlayer2ToTable();
      print("player 2 to table");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    // await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    // print("game wait for user click");
    userPermissionNeed = 1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(const Duration(seconds: KwinnigPlayerTime));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf3() async {
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setStartingCardForPlayer3ToTable();
      print("player 3 to table");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    // await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    // print("game wait for user click");
    userPermissionNeed = 1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(const Duration(seconds: KwinnigPlayerTime));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf4() async {
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setStartingCardForPlayer4ToTable();
      print("player 4 to table");
    });
    // await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    // print("game wait for user click");
    userPermissionNeed = 1;
    await waitForPlayer1Permission();
    setState(() {
      throwPlayer1CardForTapWithCheck();
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(const Duration(seconds: KtimedelayForOtherPlayers));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(const Duration(seconds: KwinnigPlayerTime));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> throwPlayer1CardForTapWithCheck() async {
    int value = throwPlayer1CardWithTheTap();
    if (value ==1){
      terminateGameWhenUserBreakRules();
      await _dialogBuilderForUserBreakRule(context);
      hideNextButton = 1;
      hidePlayButton = 0;
    }
    // while (value != 0) {
    //   print("inside while");
    //   await waitForPlayer1Permission();
    //   print("recall function to throw palyer 1 card  ");
    //   value = await throwPlayer1CardWithTheTap();
    // }
    print("player 1 card");
  }

  Future<void> _dialogBuilderForTrumpSelection(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Trump'),
          content: Container(
            height: 100,
            child: createCardHandForPlayer1FirstFourCards(),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 50,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Image(image: AssetImage("assets/spades.png")),
                onPressed: () {
                  setState(() {
                    setTrumpManuallyWhenUserSelect(1);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Image(image: AssetImage("assets/heart.png")),
                onPressed: () {
                  setState(() {
                    setTrumpManuallyWhenUserSelect(2);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Image(image: AssetImage("assets/clubs.png")),
                onPressed: () {
                  setState(() {
                    setTrumpManuallyWhenUserSelect(3);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Image(image: AssetImage("assets/diamond.png")),
                onPressed: () {
                  setState(() {
                    setTrumpManuallyWhenUserSelect(4);
                  });
                  Navigator.of(context).pop();
                },
              ),
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

  Future<void> _dialogBuilderForUserBreakRule(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You Break the Rule of the game'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
                hideNextButton = 0;
                hidePlayButton = 1;
                setState(() {
                  if (gameTurn == 5 ||
                      gameTurn == 9 ||
                      gameTurn == 13 ||
                      gameTurn == 17) {
                    startGameWhenPlayer1Turn();
                  } else {
                    startGame();
                  }
                });
                checkGameTerminate();
                if (terminateGame == 1) {
                  if (team1.getCountingCards() <= 1) {
                    _dialogBuilderForFinalNote(
                        context, const Text("We lost the game"));
                  } else {
                    _dialogBuilderForFinalNote(
                        context, const Text("We won the game"));
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> waitForPlayer1Permission() async {
    int value = 0;
    while (omi.getPlayer1Permission() != 1) {
      if (value == 100) {
        _dialogBuilderForUserInputNotification(context);
      }
      value++;
      // Simulate waiting for the variable to become 1
      print("game waits for a user input: $value");
      await Future.delayed(const Duration(milliseconds: 100));
    }

  }

  Future<void> _dialogBuilderForWinNote(BuildContext context, Text value) {
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

  Future<void> _dialogBuilderForFinalNote(BuildContext context, Text value) {
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
                SystemNavigator.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Play again'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  hideNextButton=1;
                  hidePlayButton=0;
                  playAgain();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
