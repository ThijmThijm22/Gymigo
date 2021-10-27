// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';

class DayCard extends StatefulWidget {
  final String typeWorkout;

  const DayCard({Key? key, this.typeWorkout = ""}) : super(key: key);

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  get title => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
                "{Day of the week}",
                style: TextStyle(
                    color: Globals.purple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Text(
                'Topic for the day',
                style: TextStyle(
                    color: Globals.textWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/day');
      },
    );
  }
}
