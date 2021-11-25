import 'package:flutter/material.dart';

// provider
import 'package:provider/provider.dart';
// Pages
import 'package:gymigo/pages/globals.dart';

// Widgets
import '../widgets/login_fields.dart';
import 'package:gymigo/widgets/checkbox.dart';

// ignore: must_be_immutable
class Workout extends StatefulWidget {
  late List list;
  late int itemNum;
  late Function callback;

  Workout({
    Key? key,
    required this.itemNum,
    required this.list,
    required this.callback,
    bool? checked,
  }) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  TextEditingController testcontroller = TextEditingController();
  String? validatortest() {}

  @override

  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(2),
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Row(
                children: [
                  Text(
                    'Exercise',
                    style: TextStyle(
                        color: Globals.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Theme(
                    child: MyCheckbox(
                      key: UniqueKey(),
                    ),
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                      unselectedWidgetColor: Globals.purple,
                    ),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  IconButton(
                    onPressed: () {
                      (widget.list).removeWhere(
                          (item) => item.itemNum == widget.itemNum);
                      widget.callback('random text');
                      // setState(() {});
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Globals.purple,
                    ),
                  )
                ],
              ),
            ),
            NewInput(
                validate: validatortest(),
                controller: testcontroller,
                bgColor: Globals.boxGrey,
                color: Colors.white,
                placeholder: 'Enter exercise here'),
            Divider(
              color: Globals.textGrey,
              height: 25,
              thickness: 0.25,
              indent: 100,
              endIndent: 100,
            ),
          ],
        ));
  }
}
