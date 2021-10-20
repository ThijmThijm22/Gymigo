import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 110, 110),
      appBar: AppBar(
        title: Text(
          'Gymigo',
          style: TextStyle(color: Color.fromARGB(255, 46, 46, 46)),
        ),
      ),
    );
  }
}
