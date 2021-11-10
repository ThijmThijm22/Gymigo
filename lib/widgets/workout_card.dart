import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 360,
      height: 120,
      decoration: BoxDecoration(
          color: Globals.boxGrey, borderRadius: BorderRadius.circular(8)),
    );
  }
}
