import 'package:flutter/material.dart';

import 'globals.dart';

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

      appBar: AppBar(
        title: Text('Gymigo'),
        centerTitle: true,
        backgroundColor: Globals.background,

      ),
      
    );
  }
}