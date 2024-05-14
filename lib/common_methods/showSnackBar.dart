import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({required String text, required BuildContext context}){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(text),
  ));;
}