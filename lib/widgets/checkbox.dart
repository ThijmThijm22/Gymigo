import 'package:flutter/material.dart';

import 'package:gymigo/pages/globals.dart';

// provider
import 'package:gymigo/provider/dayprovider.dart';
import 'package:provider/provider.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({required Key key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    Key? key = widget.key;
    return Checkbox(
      value: Provider.of<DayProv>(context, listen: true)
              .checked[key.hashCode] ??
          false,
      onChanged: (value) {
        print(
            'checkbox[${key.hashCode}]: ${Provider.of<DayProv>(context, listen: false).checked[key.hashCode]}');
        setState(() {
          Provider.of<DayProv>(context, listen: false)
              .changeChecked(value, widget.key.hashCode);
        });
      },
      checkColor: Globals.boxGrey,
      activeColor: Globals.purple,
    );
  }
}
