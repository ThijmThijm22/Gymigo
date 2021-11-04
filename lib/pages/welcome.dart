import 'dart:async';

import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:http/http.dart';
import 'dart:convert';
// import 'dart:async';

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

  setQuote() {
    GetQuote()
        .randomNum()
        .then((res) => quoteData = res)
        .then((res) => quote = quoteData["text"])
        .then((res) => author = quoteData["author"]);
  }

  quoteTimer() async {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        
      });
      timer.cancel();
    });
  }

  Widget build(BuildContext context) {
    setQuote();
    quoteTimer();
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: Text(
              quote,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            "-${author}",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 200),
          RoundButton(title: "Next", bgColor: Globals.purple, pressed: () {})
        ],
      ),
    );
  }
}
