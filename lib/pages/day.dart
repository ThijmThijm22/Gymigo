import 'package:flutter/material.dart';
import 'package:gymigo/widgets/date_widget.dart';
import 'package:gymigo/widgets/workout_card.dart';

import 'globals.dart';

// provider
import 'package:provider/provider.dart';
import 'package:gymigo/provider/firestoreprov.dart';

class Day extends StatefulWidget {
  late String day;
  Day({Key? key, this.day = "Monday"}) : super(key: key);

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  int keys = 0;
  List<Widget> workouts = [];

  callback(workouts) {
    setState(() {});
  }

  // DateTime now = DateTime.now();
  // String today = DateFormat('EEEE').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    TextEditingController topicController = TextEditingController();

    var fireProv = Provider.of<FireProv>(context, listen: true);
    var fireProvStream = Provider.of<List>(context, listen: true);

    Map data = {};

    for (var e in fireProvStream) {
      var eData = e.data();
      if (eData['day'] == widget.day) {
        data = {
          'day': eData['day'],
          'topic': eData['topic'],
          'widgets': eData['widgets'],
        };
        break;
      }
    }

    return Scaffold(
        backgroundColor: Globals.background,
        body: Wrap(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextField(
                controller: topicController,
                textInputAction: TextInputAction.go,
                maxLength: 35,
                onSubmitted: (e) {
                  fireProv.updateData(
                      widget.day, 'topic', topicController.text);
                },
                style: TextStyle(
                    color: Globals.purple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: data['topic'] == 'Press me'
                      ? "What's in today's workout?"
                      : data['topic'],
                  hintStyle: TextStyle(fontSize: 24, color: Globals.purple),
                ),
              ),
            ),
          ),
          Container(
            color: Globals.boxGrey,
            height: 525,
            width: 400,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: ListView(
                  children: [
                    // TextField(
                    //   // keyboardType: TextInputType.multiline,
                    //   minLines: 1,
                    //   maxLines: 5,
                    //   style: TextStyle(
                    //       color: Globals.white2,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold),
                    //   decoration: InputDecoration(
                    //     border: InputBorder.none,
                    //     hintText:
                    //         "Write here your notes for today's workout session ...",
                    //     hintStyle:
                    //         TextStyle(fontSize: 15, color: Globals.white2),
                    //   ),
                    // ),
                    Column(children: workouts),
                  ],
                ),
              ),
            ),
          ),
        ]),
        appBar: AppBar(
          title: Date(
            day: data['day'] ?? '',
          ),
          centerTitle: true,
          backgroundColor: Globals.background,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                workouts.forEach((element) {});
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Map widgets = data['widgets'];
            if (widgets.isNotEmpty) {
              widgets[(widgets.length).toString()] = {
                'itemNum': 0,
                'checked': false,
                'exercise': 'Enter exercise here',
              };
              fireProv.updateData(data['day'], 'widgets', widgets);
            } else {
              fireProv.updateData(data['day'], 'widgets', {
                '0': {
                  'itemNum': 0,
                  'checked': false,
                  'exercise': 'Enter exercise here',
                },
              });
            }
            workouts.add(Workout(
              itemNum: widgets.length,
              data: data,
              // widgetData: widgets[(widgets.length -1).toString()],
            ));
            // setState(() {});
          },
          backgroundColor: Globals.purple,
          child: const Icon(Icons.add),
        ));
  }
}
