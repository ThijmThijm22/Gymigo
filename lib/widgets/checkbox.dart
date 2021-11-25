import 'package:flutter/material.dart';

import 'package:gymigo/pages/globals.dart';

// provider
import 'package:provider/provider.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({required Key key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    Key? key = widget.key;
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
