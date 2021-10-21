import 'package:flutter/material.dart';

// Import pages
import 'package:gymigo/pages/login.dart';
import 'package:gymigo/pages/home.dart';
import 'package:gymigo/pages/day.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  theme: ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    primaryColor: Colors.white,
  ),

  initialRoute: '/login',
  routes: {
    '/login': (context) => Login(),
    '/home': (context) => Home(),
    '/day': (context) => Day(),
  }
));
