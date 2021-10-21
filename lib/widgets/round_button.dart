import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  late String title;
  late double width;
  late double height;
  late Color bgColor;

  late Function pressed;

  RoundButton({ this.width = 300, this.height = 40, this.bgColor = Colors.green, this.title = 'Click Me!', required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  pressed();
                },
                child: Text(
                  title,
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(bgColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    )
                  ),
              ),
            );
  }
}