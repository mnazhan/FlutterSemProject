import 'package:flutter/material.dart';


class cardsOfPreviousRounds extends StatelessWidget {
  const cardsOfPreviousRounds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Previous Cards"),
            centerTitle: true,
          ),
        ),);
  }
}
