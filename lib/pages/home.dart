import 'package:flutter/material.dart';
import 'package:gymigo/pages/globals.dart';
import 'package:gymigo/widgets/dayCard.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;

  // FireStore om de gegevens op te slaan van de gebruiker (IN PROGRESS)
  Map userData = {};
  makeCollection() {
    var inst = FirebaseFirestore.instance;
    var collectie = inst.collection(user!.uid);


    collectie.get().then((res) {
      if (res.docs.toString() == '[]') {
        print('new collection');
        inst.collection(user!.uid).add({
          'email': user!.email,
          'Monday': 'Push',
          'Tuesday': 'Pull',
          'Wednesday': 'Legs',
          'Thursday': 'Rest Day',
          'Friday': 'Push',
          'Saturday': 'Pull',
          'Sunday': 'Legs',
        });
      } else {
        print('getting collection');

        collectie.get().then((res) {
          res.docs.forEach((el) {
            userData = el.data();
            print(userData);
            print(userData['Monday']);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    makeCollection();

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Globals.background,
      body: SingleChildScrollView(
        child: Wrap(children: <Widget>[
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
                user == null
                    ? "Welcome Back"
                    : "Welcome Back, " + user.email.toString(),
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

          
          DayCard(day: 'Monday', topic: userData['Monday'] == null ? "" : userData['Monday']),
          DayCard(day: 'Tuesday', topic: userData['Tuesday'] == null ? "" : userData['Tuesday']),
          DayCard(day: 'Wednesday', topic: userData['Wednesday'] == null ? "" : userData['Wednesday']),
          DayCard(day: 'Thursday', topic: userData['Thursday'] == null ? "" : userData['Thursday']),
          DayCard(day: 'Friday', topic: userData['Friday'] == null ? "" : userData['Friday']),
          DayCard(day: 'Saturday', topic: userData['Saturday'] == null ? "" : userData['Saturday']),
          DayCard(day: 'Sunday', topic: userData['Sunday'] == null ? "" : userData['Sunday']),

          // checken voor enumeraties in Flutter: enum maken met dagen van
          // de week en dan elke card een vaste waarden geven aan de hand
          // van de card & dag. card 1 = altijd Monday, ...
        ]),
      ),
    );
  }
}
