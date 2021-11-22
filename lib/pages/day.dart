import 'package:flutter/material.dart';
import 'package:gymigo/pages/home.dart';
import 'package:gymigo/widgets/workout_card.dart';

import 'globals.dart';

class Day extends StatefulWidget {
  const Day({Key? key}) : super(key: key);

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  int keys = 0;
  List<Widget> workouts = [];

  callback(workouts) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Globals.background,
        body: Wrap(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextField(
                maxLength: 35,
                style: TextStyle(
                    color: Globals.purple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: " ",
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: ListView(
                  children: [
                    TextField(
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
                        hintStyle:
                            TextStyle(fontSize: 15, color: Globals.textWhite),
                      ),
                    ),
                    Column(children: workouts),
                  ],
                ),
              ),
            ),
          ),
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            keys++;
            workouts.add(Workout(
              key: UniqueKey(),
              itemNum: keys,
              list: workouts,
              callback: callback,
            ));
            setState(() {});
          },
          backgroundColor: Globals.purple,
          child: const Icon(Icons.add),
        ));
  }
}
