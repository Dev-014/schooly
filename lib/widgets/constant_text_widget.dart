import 'package:flutter/material.dart';

class ConstantTextWidget{

  static Text normalText({bool bold= false,required String text, Color? color}){
    return Text(text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: (bold)?FontWeight.bold:FontWeight.normal,
      color: color??Colors.black
    ),);
  }

  static Text smallText({bool bold= false,required String text,Color? color}){
    return Text(text,
      style: TextStyle(
          fontSize: 14,
          fontWeight: (bold)?FontWeight.bold:FontWeight.normal,
          color: color??Colors.black

      ),);
  }
}