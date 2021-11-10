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
          margin: EdgeInsets.only(left: 23),
          child: Align(
            alignment: Alignment.topLeft,
            child: TextField(
              maxLength: 35,
              style: TextStyle(
                  color: Globals.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: "What's in today's workout?",
                hintStyle: TextStyle(fontSize: 24, color: Globals.textGrey),
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
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                style: TextStyle(
                    color: Globals.textGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      "Write here your notes for today's workout session ...",
                  hintStyle: TextStyle(fontSize: 15, color: Globals.textWhite),
                ),
              ),
            ),
          ),
        )
      ]),
      appBar: AppBar(
        title: Text(
          // UPGRADE: de datum zou automatisch moeten veranderen naar de dag zelf
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
