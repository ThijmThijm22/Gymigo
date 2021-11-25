import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Pages
import 'package:gymigo/pages/globals.dart';

// Widgets
import 'package:gymigo/widgets/day_card.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// provider
import 'package:provider/provider.dart';
import 'package:gymigo/provider/firestoreprov.dart';

class  HomeStream extends StatelessWidget {
  const HomeStream ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
    create: (context) => FireProv().getUserData(),
    initialData: Map(),
    child: Home(),
  );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;

  // FireStore om de gegevens op te slaan van de gebruiker (IN PROGRESS)
  Map userData = {
    'Monday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Tuesday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Wednesday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Thursday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Friday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Saturday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
    'Sunday': {
      'checked': false,
      'topic': "under construction...",
      'widgets': {}
    },
  };
  makeCollection() {
    var inst = FirebaseFirestore.instance;
    var collectie = inst.collection(user!.uid);

    collectie.get().then((res) {
      if (res.docs.toString() == '[]') {
        print('new collection');
        inst.collection(user!.uid).add({
          'email': user!.email,
          'Monday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Tuesday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Wednesday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Thursday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Friday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Saturday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
          'Sunday': {
            'checked': false,
            'topic': "under construction...",
            'widgets': {}
          },
        });
      } else {
        print('getting collection');

        collectie.get().then((res) {
          res.docs.forEach((el) {
            userData = el.data();
            print(userData);
            print(userData['Monday']);
            setState(() {});
          });
        });
      }
    });
  }

  void initState() {
    super.initState();
    makeCollection();
  }

  DateTime now = DateTime.now();
  String today = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    
    // FireProv result = Provider.of<FireProv>(context);
    // print('fireprof: $result');

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
                    'Datum: $today',
                    style: TextStyle(color: Globals.textGrey, fontSize: 15),
                  ),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 20),
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
            margin: const EdgeInsets.only(left: 15, top: 8),
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

          // Als je niks ziet bij de daycards dan kan dat zijn omdat de gebruiker niet ingelogd is
          // Je kan inloggen met test1@test.com, password: 123456
          // Als je verkeerd wachtwoord ingeeft dan blokkeer de app nog momenteel dit komt door een fout bij flutter zelf
          DayCard(day: 'Monday', topic: userData['Monday']['topic'].toString()),
          DayCard(
              day: 'Tuesday', topic: userData['Tuesday']['topic'].toString()),
          DayCard(
              day: 'Wednesday',
              topic: userData['Wednesday']['topic'].toString()),
          DayCard(
              day: 'Thursday', topic: userData['Thursday']['topic'].toString()),
          DayCard(day: 'Friday', topic: userData['Friday']['topic'].toString()),
          DayCard(
              day: 'Saturday', topic: userData['Saturday']['topic'].toString()),
          DayCard(day: 'Sunday', topic: userData['Sunday']['topic'].toString()),

          // checken voor enumeraties in Flutter: enum maken met dagen van
          // de week en dan elke card een vaste waarden geven aan de hand
          // van de card & dag. card 1 = altijd Monday, ...
        ]),
      ),
    );
  }
}
