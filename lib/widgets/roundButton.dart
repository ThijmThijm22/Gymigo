import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  late double width;
  late double height;
  late Color bgColor;

  RoundButton({ this.width = 300, this.height = 40, this.bgColor = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              width: width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  style: ButtonStyle(
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