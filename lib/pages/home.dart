import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';
import 'package:gymigo/widgets/dayCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Wrap(children: <Widget>[
        SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Gymigo',
                  style: TextStyle(color: Globals.textGrey, fontSize: 15),
                ),
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Welcome back, Ferre!',
              style: TextStyle(
                color: Globals.purple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'This is your week:',
              style: TextStyle(
                color: Globals.textWhite,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DayCard(),
      ]),
    );
  }
}
