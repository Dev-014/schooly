import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({required String text, required BuildContext context,bool showError = false}){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: showError?Colors.red: Colors.black87,
    content: Text(text),
  ));
}