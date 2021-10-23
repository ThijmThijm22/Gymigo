import 'package:flutter/material.dart';

// Import pages
import 'package:gymigo/pages/login.dart';
import 'package:gymigo/pages/home.dart';
import 'package:gymigo/pages/day.dart';

// Google Fonts
import 'package:google_fonts/google_fonts.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        primaryColor: Colors.white,
      ),
      initialRoute: '/home',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/day': (context) => Day(),
      }));
}
