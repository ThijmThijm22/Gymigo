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
    Timer.periodic(const Duration(seconds: 10), (timer) {
      setQuote();
      setState(() {});
    });
  }

  // Deze functie runt wanner de app gebuild is
  @override
  void initState() {
    super.initState();
    setQuote().then((res) {
      setState(() {});
      quoteTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'assets/gymigo_logo_final.png',
            width: 300,
          ),
          const SizedBox(height: 100),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Center(
                    child: Text(
                      quote == ""
                          ? "Light Weight BABY!"
                          : "\"$quote\"",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  author == "" ? "- Ronnie Coleman" : "- $author",
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
