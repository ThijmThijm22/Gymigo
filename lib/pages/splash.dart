import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splashh extends StatefulWidget {
  const Splashh({Key? key}) : super(key: key);

  @override
  State<Splashh> createState() => _SplashhState();
}

class _SplashhState extends State<Splashh> {
  @override
    void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Globals.background,
      body:Column(
        children:  [

          SafeArea(child: SizedBox(height: 30,)),

            const Center(
              child: Text(
              'Gymigo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

          ),

          SizedBox(height: 300),

          SpinKitRing(
            color: Globals.purple,
            size: 80,

          )
        ],
      ),
    );
  }
}
