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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.manropeTextTheme(),
            primaryColor: Colors.white,
          ),
          initialRoute: '/home',
          routes: {
            '/splash': (context) => Splash(
                  routeTo: '/welcome',
                ),
            '/welcome': (context) => const Welcome(),
            '/login': (context) => const Login(),
            '/home': (context) => const HomeStream(),
            '/day': (context) => Day(),
          }),
    );
  }
}
