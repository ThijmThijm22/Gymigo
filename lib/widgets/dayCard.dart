// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DayCard extends StatefulWidget {
  late String dayOfWeek;
  late String title;

  DayCard({this.dayOfWeek = "", this.title = ""});

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
    );
  }
}
