import 'package:flutter/material.dart';
import '../CreateCardsForRouns.dart';
import '../screencardfunctions.dart';

class cardsOfPreviousRounds extends StatefulWidget {
  const cardsOfPreviousRounds({Key? key}) : super(key: key);

  @override
  State<cardsOfPreviousRounds> createState() => _cardsOfPreviousRoundsState();
}

class _cardsOfPreviousRoundsState extends State<cardsOfPreviousRounds> {
  @override
  late int round;
  void initState() {
    super.initState();
    round = omi.getRound();
    // Initialization tasks can be performed here.
    print("Round value : $round");
    print('initState called');
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const Text("Previous Cards"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  if(round>1)
                    createCardRounds(Round: 1,),
                  if(round>2)
                    createCardRounds(Round: 2,),
                  if(round>3)
                    createCardRounds(Round: 3,),
                  if(round>4)
                    createCardRounds(Round: 4,),
                  if(round>5)
                    createCardRounds(Round: 5,),
                  if(round>6)
                    createCardRounds(Round: 6,),
                  if(round>7)
                    createCardRounds(Round: 7,),
                  if(round>=8)
                    createCardRounds(Round: 8,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
