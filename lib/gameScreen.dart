import 'dart:async';

import 'package:flutter/material.dart';
import 'screencardfunctions.dart';

class gamescreen extends StatefulWidget {
  const gamescreen({Key? key}) : super(key: key);

  @override
  State<gamescreen> createState() => _gamescreenState();
}

class _gamescreenState extends State<gamescreen> {
  // late Completer<int> _completer;


  @override
  void initState() {
    super.initState();
    // Create the completer when the widget is initialized
    // _completer = Completer<int>();
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
                    FilledButton(
                      child: const Text("Play"),
                      onPressed: () async {
                        for (int i = 0; i < 8; i++) {
                          int beiginner = omi.getBeginner();
                          print("Biginning player: $beiginner");
                          if (beiginner == 1) {
                            await whenTrunIsf1();
                          } else if (beiginner == 2) {
                            await whenTrunIsf2();
                          } else if (beiginner == 3) {
                            await whenTrunIsf3();
                          } else {
                            await whenTrunIsf4();
                          }
                          await Future.delayed(Duration(seconds: 2), () {
                            print('This code runs after a delay of 2 seconds');
                          });
                        }
                      }
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FilledButton(
                      child: const Text("Start"),
                      onPressed: () {},
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
                  ()  {
                    // _completer.complete(2);
                    print("Helo world");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> whenTrunIsf1() async {
    setState(() {
      // FutureBuilder(
      //   future: _completer.future,
      //   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasData) {
      //         print("Feature complete with : ${snapshot.data}");
      //         setStartingCardForPlayer1ToTable();
      //         print("player 1 to table");
      //         return Text("Future completed with: ${snapshot.data}");
      //       } else {
      //         print("Flutter completed with no data ");
      //         return Text("Future completed with no data");
      //       }
      //     } else {
      //       print("future not completed yet");
      //       return Text("Future not completed yet");
      //     }
      //   },
      // );
      setStartingCardForPlayer1ToTable();
      print("player 1 to table");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf2() async {
    setState(() {
      setStartingCardForPlayer2ToTable();
      print("player 2 to table");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer1ToTable();
      print("player 1 card");
    });
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf3() async {
    setState(() {
      setStartingCardForPlayer3ToTable();
      print("player 3 to table");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer4ToTable();
      print("player 4 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer1ToTable();
      print("player 1 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      findthewinningPlayer();
    });
  }

  Future<void> whenTrunIsf4() async {
    setState(() {
      setStartingCardForPlayer4ToTable();
      print("player 4 to table");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer1ToTable();
      print("player 1 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer2ToTable();
      print("player 2 card");
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      setCardForPlayer3ToTable();
      print("player 3 card");
    });
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      findthewinningPlayer();
    });
  }
}
