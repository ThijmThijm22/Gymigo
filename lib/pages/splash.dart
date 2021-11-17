import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  late String routeTo;

  Splash({required this.routeTo});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Image.asset('assets/gymigo_logo_final.png', width: 300),
          ),
          const SizedBox(height: 250),
          SpinKitRing(
            color: Globals.purple,
            size: 80,
          )
        ],
      ),
    );
  }
}
