import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';

class Date extends StatefulWidget {
  final String day;
  const Date({Key? key, this.day = "Day of the week"}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.day,
        style: TextStyle(color: Globals.textGrey, fontSize: 15),
      ),
    );
  }
}
