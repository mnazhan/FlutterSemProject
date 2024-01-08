import 'package:flutter/material.dart';

class SetingScreen extends StatelessWidget {
  const SetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Color(0xFF272D2D),
        ),
        body: Container(
          color: const Color(0xFF141E1D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Color(0xFF446062),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: const Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
