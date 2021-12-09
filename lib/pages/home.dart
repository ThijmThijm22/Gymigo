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

class HomeStream extends StatelessWidget {
  const HomeStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List>(
          create: (context) => FireProv().getUserData,
          initialData: const [],
        ),
        ChangeNotifierProvider(
          create: (context) => FireProv(),
        ),
      ],
      child: const Home(),
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

  @override
  void initState() {
    super.initState();
  }

  // DateTime now = DateTime.now();
  String today = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var fireProv = Provider.of<FireProv>(context, listen: true);
    var fireProvStream = Provider.of<List>(context, listen: true);

    Map daysOfWeek = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday'
    };

    List<Widget> dayCardWidgets = [];

    if (fireProvStream.isEmpty) {
      for (int i = 1; i <= daysOfWeek.length; i++) {
        fireProv.setUserData(
          daysOfWeek[i],
          false,
          'Press me',
        );
      }
    }

    if (fireProvStream.isNotEmpty) {
      for (int i = 1; i <= daysOfWeek.length; i++) {
        fireProvStream.forEach((e) {
          var data = e.data();
          if(data['day'] == daysOfWeek[i]){
          dayCardWidgets.add(
            DayCard(
              key: UniqueKey(),
              day: data['day'],
              topic: data['topic'],
            ),
          );
          }
        });
      }

      setState(() {
        
      });
    }

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Globals.background,
      body: SingleChildScrollView(
        child: Wrap(children: <Widget>[
          SafeArea(
            child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    today,
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
          Column(
            children: dayCardWidgets,
          )
        ]),
      ),
    );
  }
}
