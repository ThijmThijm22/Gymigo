// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';

class DayCard extends StatefulWidget {
  final String dayOfWeek;
  final String typeWorkout;

  const DayCard({Key? key, this.dayOfWeek = "", this.typeWorkout = ""})
      : super(key: key);

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  get dayOfWeek => null;

  get title => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 360,
      height: 120,
      decoration: BoxDecoration(
          color: Globals.boxGrey, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
            child: Text(
              dayOfWeek ?? "No day selected",
              style: TextStyle(
                  color: Globals.purple,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              title ?? "No title",
              style: TextStyle(
                  color: Globals.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
