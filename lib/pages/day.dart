import 'package:flutter/material.dart';
import 'package:gymigo/widgets/date_widget.dart';
import 'package:gymigo/widgets/workout_card.dart';

import 'globals.dart';

// Date:
// import 'package:intl/intl.dart';

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

  // DateTime now = DateTime.now();
  // String today = DateFormat('EEEE').format(DateTime.now());

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
                  counterText: "",
                  border: InputBorder.none,
                  hintText: "What's in today's workout?",
                  hintStyle: TextStyle(fontSize: 24, color: Globals.purple),
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
                          color: Globals.white2,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "Write here your notes for today's workout session ...",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Globals.white2),
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
          // title: Text(
          //
          //   'Maandag, 25 oktober 2021',
          //   style: TextStyle(color: Globals.textGrey, fontSize: 15),
          // ),
          //
          //
          // LOGO IMAGE:
          // title: Image.asset(
          //   'assets/gymigo_logo_final.png',
          //   width: 85,
          // ),
          title: Date(
            day: 'Maandag',
          ),
          centerTitle: true,
          backgroundColor: Globals.background,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                workouts.forEach((element) {});
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
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
