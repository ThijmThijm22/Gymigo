import 'package:flutter/material.dart';

import 'globals.dart';
import '../widgets/roundButton.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.background,
      body: Center(
        child: Column(
          children:  [
            SizedBox(height: 120),

            Text(
              'Gymigo',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 300),

            RoundButton(bgColor: Globals.purple),
            SizedBox(height: 40),
            RoundButton(bgColor: Globals.background),
          ],
        ),
      )
      
    );
  }
}