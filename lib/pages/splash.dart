import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class Splash extends StatefulWidget {
  late String routeTo;

  Splash({Key? key, required this.routeTo}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, widget.routeTo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          const SizedBox(height: 100),
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
