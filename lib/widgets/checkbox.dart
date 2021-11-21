import 'package:flutter/material.dart';

import 'package:gymigo/pages/globals.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checkbox,
      onChanged: (value) {
        setState(() {
          _checkbox = value!;
        });
      },

      checkColor: Globals.boxGrey,
      activeColor: Globals.purple,
    );
  }
}
