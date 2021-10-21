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
          backgroundColor: Color.fromARGB(255, 46, 46, 46),
          primaryColor: Colors.white,
        ),
        initialRoute: '/home',
        routes: {
          '/login': (context) => Login(),
          '/home': (context) => Home(),
          '/day': (context) => Day(),
        }));
