import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  String text;


  MyButton({super.key, required this.onTap, required this.text});
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 25),
        child: Center(
          child: 
          Text(text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
          
        ),
      ),
    );
  }
}