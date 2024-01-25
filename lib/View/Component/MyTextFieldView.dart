import 'package:flutter/material.dart';

class MyTextFieldView extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextFieldView({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple.shade100)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple.shade300 )
              ),
              fillColor: Colors.deepPurple.shade100,
              filled: true,
              hintText: hintText,
            ),
            ),
            );
  }
}