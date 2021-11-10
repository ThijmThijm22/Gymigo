import 'dart:async';

import 'package:flutter/material.dart';
import 'globals.dart';

import '../widgets/round_button.dart';

import '../services/get_quote.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Map quoteData = {};
  String quote = "";
  String author = "";

  // Geeft de quote en author variable een waarde
  Future setQuote() async {
    GetQuote()
        .randomNum()
        .then((res) => quoteData = res)
        .then((res) => quote = quoteData["text"])
        .then((res) => author = quoteData["author"]);
  }

  // Timer verandert om de zoveel seconden de quote
  quoteTimer() async {
    Timer.periodic(Duration(seconds: 10), (timer) {
      setQuote();
      setState(() {});
    });
  }

  // Deze functie runt wanner de app gebuild is
  void initState() {
    super.initState();
    setQuote().then((res) {
      setState(() {});
      quoteTimer();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Welcome To",
              style: TextStyle(
                fontSize: 50,
                color: Globals.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "Gymigo",
              style: TextStyle(
                fontSize: 50,
                color: Globals.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            height: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Center(
                    child: Text(
                      quote == "" ? "When live gives pain, GO TO THE GYM" : "\"${quote}\"",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Text(
                  author == "" ? "BIG MAN" : "- ${author}",
                  style: TextStyle(
                    color: Globals.purple,
                  ),
                ),
              ],
            ),
          ),
          RoundButton(
              title: "Next",
              bgColor: Globals.purple,
              pressed: () {
                Navigator.pushNamed(context, '/login');
              })
        ],
      ),
    );
  }
}
