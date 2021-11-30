import 'package:flutter/material.dart';

import 'package:gymigo/pages/globals.dart';


class MyCheckbox extends StatefulWidget {
  const MyCheckbox({required Key key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checked,
      onChanged: (value) {
        _checked = value!;
        setState(() {});
      },
      checkColor: Globals.boxGrey,
      activeColor: Globals.purple,
    );
  }
}
