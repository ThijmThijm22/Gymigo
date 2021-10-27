import 'package:flutter/material.dart';

import 'globals.dart';

class Day extends StatefulWidget {
  const Day({Key? key}) : super(key: key);

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Wrap(children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextField(
              style: TextStyle(
                  color: Globals.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What will you train?",
                hintStyle: TextStyle(fontSize: 20, color: Globals.textWhite),
              ),
            ),
          ),
        ),
        Container(
          color: Globals.boxGrey,
          height: 525,
          width: 400,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextField(
                style: TextStyle(
                    color: Globals.textGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Notes about this workout:",
                  hintStyle: TextStyle(fontSize: 15, color: Globals.textWhite),
                ),
              ),
            ),
          ),
        )
      ]),
      appBar: AppBar(
        title: Text(
          'Maandag, 25 oktober 2021',
          style: TextStyle(color: Globals.textGrey, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Globals.background,
        elevation: 0,
      ),
    );
  }
}
