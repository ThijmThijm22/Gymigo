import 'package:flutter/material.dart';

// provider
import 'package:provider/provider.dart';
import 'package:gymigo/provider/firestoreprov.dart';

// Pages
import 'package:gymigo/pages/globals.dart';

// Widgets
import '../widgets/login_fields.dart';
import 'package:gymigo/widgets/checkbox.dart';

// ignore: must_be_immutable
class Workout extends StatefulWidget {
  late int itemNum;
  late Map data;
  // late Map widgetData;
  Workout({
    Key? key,
    required this.itemNum,
    required this.data, // required Map widgetData
  }) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  TextEditingController testcontroller = TextEditingController();
  String? validatortest() {}

  @override
  Widget build(BuildContext context) {
    var fireProv = Provider.of<FireProv>(context, listen: true);
    var fireProvStream = Provider.of<List>(context, listen: true);

    setState(() {
      
    });

    Map widgets = widget.data['widgets'];
    // print(widgets);
    print(widgets['3']);

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
                    'Exercise: ${widget.itemNum == 0 ? widget.itemNum++ : widget.itemNum}',
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
                    width: 150,
                  ),
                  IconButton(
                    onPressed: () {},
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
