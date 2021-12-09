import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gymigo/pages/day.dart';

// Pages
import 'package:gymigo/pages/globals.dart';

// Widgets
import 'package:gymigo/widgets/checkbox.dart';

// provider
import 'package:provider/provider.dart';
import 'package:gymigo/provider/firestoreprov.dart';

class DayCard extends StatefulWidget {
  final String day;
  final String topic;

  const DayCard(
      {Key? key,
      this.day = "Day of the week",
      this.topic = "Topic for the day"})
      : super(key: key);

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    var fireProv = Provider.of<FireProv>(context, listen: true);
    var fireProvStream = Provider.of<List>(context, listen: true);


    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 360,
        height: 120,
        decoration: BoxDecoration(
            color: Globals.boxGrey, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
              child: Text(
                widget.day,
                style: TextStyle(
                    color: Globals.purple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Theme(
                    child: MyCheckbox(key: UniqueKey()),
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                      unselectedWidgetColor: Globals.textWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                    child: Text(
                      widget.topic,
                      style: TextStyle(
                          color: Globals.textWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              child: Day(day: widget.day,),
              providers: 
            [
              StreamProvider<List>(
          create: (context) => FireProv().getUserData,
          initialData: const [],
        ),
        ChangeNotifierProvider(
          create: (context) => FireProv(),
        ),
            ]),
        ));
      },
      splashFactory: NoSplash.splashFactory,
      highlightColor: const Color.fromRGBO(0, 0, 0, 0),
    );
  }
}
