import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';

// Widgets
import '../widgets/login_fields.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {

  TextEditingController testcontroller = TextEditingController();
  String? validatortest() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(2),
        width: 360,
        // height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
              child: Text(
                'Exercise',
                style: TextStyle(
                    color: Globals.purple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),

            NewInput(validate: validatortest(), controller: testcontroller, bgColor: Globals.boxGrey)
            
          ],
        ));
  }
}