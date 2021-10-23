import 'package:flutter/material.dart';

class NewInput extends StatelessWidget {

  late String placeholder;
  final controller;
  late Color bgColor;
  late Color color;
  late bool obscure;

  NewInput({
    this.placeholder = "",
    required this.controller,
    this.bgColor = const Color.fromARGB(255, 228, 230, 255),
    this.color = const Color.fromARGB(255, 135, 120, 120), 
    this.obscure = false,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder,
          filled: true,
          fillColor: bgColor,
          focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: bgColor,
            ),
            borderRadius: BorderRadius.circular(10),
          )
        ),
        controller: controller,
        obscureText: obscure,
      ),
    );
  }
}