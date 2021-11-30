import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  late String title;
  late double width;
  late double height;
  late Color bgColor;

  late Function pressed;

  RoundButton({Key? key,  this.width = 300, this.height = 40, this.bgColor = Colors.green, this.title = 'Click Me!', required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: height,
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  pressed();
                },
                child: Text(
                  title,
                  style: const TextStyle(
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
