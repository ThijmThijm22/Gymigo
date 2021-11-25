import 'package:flutter/material.dart';

class NewInput extends StatelessWidget {
  late String placeholder;
  final controller;
  late Color bgColor;
  late Color color;
  late bool obscure;
  final validate;

  NewInput({
    this.placeholder = "",
    required this.controller,
    this.bgColor = const Color.fromARGB(255, 228, 230, 255),
    this.color = const Color.fromARGB(255, 135, 120, 120),
    this.obscure = false,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            color: color,
          ),
          filled: true,
          fillColor: bgColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bgColor,
            ),
            borderRadius: BorderRadius.circular(10),
          )),
      style: TextStyle(
        color: color,
      ),
      controller: controller,
      validator: validate,
      obscureText: obscure,
    );
  }
}
