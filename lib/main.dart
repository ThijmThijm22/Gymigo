import 'package:flutter/material.dart';

// import pages
import 'package:gymigo/pages/login.dart';
import 'package:gymigo/pages/home.dart';
import 'package:gymigo/pages/day.dart';

void main() => runApp(MaterialApp(initialRoute: '/home', routes: {
      '/login': (context) => Login(),
      '/home': (context) => Home(),
      '/day': (context) => Day(),
    }));
