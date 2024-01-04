import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'screencardfunctions.dart';

class gamescreen extends StatelessWidget {
  const gamescreen({
    super.key,
    required this.widget,
  });
  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Column(
            children: [
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
                    child: createCardHandForPlayer1(),
                  )),
            ],
          )),
    );
  }
}
