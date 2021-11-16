import 'package:flutter/material.dart';

// Import pages
import 'package:gymigo/pages/splash.dart';
import 'package:gymigo/pages/login.dart';
import 'package:gymigo/pages/home.dart';
import 'package:gymigo/pages/day.dart';
import 'package:gymigo/pages/welcome.dart';

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
        '/splash': (context) => const Splashh(),
        '/welcome': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/day': (context) => const Day(),
      }));
}
