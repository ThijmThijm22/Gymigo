import 'package:flutter/material.dart';
import 'globals.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Column(
        children: [
          SizedBox(height: 40,),

            Center(
              child: Text(
                "Welcome To",
                style: TextStyle(
                  fontSize: 50,
                  color: Globals.purple,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),

          SizedBox(height: 5),

          Center(
            child: Text(
              "Gymigo",
              style: TextStyle(
                fontSize: 50,
                color: Globals.purple,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),

          SizedBox(height: 50),

          Container(
            width: 300,
            child: Image.asset("assets/w_one.jpg")
            ),
        ],
      ),
    );
  }
}