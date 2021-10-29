import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:http/http.dart';
import 'dart:convert';
// import 'dart:async';

import '../widgets/round_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String quote = "";

  GetQuote() async{
    Response res = await get(Uri.parse('https://type.fit/api/quotes'));
     Map data = jsonDecode(res.body);
    quote = data['quote'].toString();
    // print(quote);
  }


  @override
  Widget build(BuildContext context) {
  GetQuote();
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          SizedBox(height: 40,),

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

          Text(quote),

          SizedBox(height: 200),

          RoundButton(title:"Next",bgColor: Globals.purple,pressed: () {

          })
        ],
      ),
    );
  }
}