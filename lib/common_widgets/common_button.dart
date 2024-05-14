import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice/common_methods/showSnackBar.dart';


class LoaderElevatedButton extends StatefulWidget {
 final String buttonText;
 final Future<dynamic> Function() onPressed;
 final Color? buttonColor;
 final Color? loaderColor;
 final Color? textColor;
 final double? buttonHeight;

  LoaderElevatedButton({required this.buttonText,required this.onPressed,this.buttonColor,this.textColor,this.buttonHeight,this.loaderColor,super.key});

  @override
  State<LoaderElevatedButton> createState() => _LoaderElevatedButtonState();
}

class _LoaderElevatedButtonState extends State<LoaderElevatedButton> {

  // late Completer<dynamic> _completer;

  var _isLoading = false;
  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.buttonHeight??44,
      child: ElevatedButton(

        onPressed: () async {

         _toggleLoading();
          // Your upload/ submit method
         try {
           var result = await widget.onPressed();
           showSnackBar(text: "Submitted", context: context);

           // _completer.complete(result);

         } catch (error) {
           // _completer.completeError(error);
           showSnackBar(text: error.toString(), context: context);
         } finally {
           _toggleLoading();
         }
        },
        style: ButtonStyle(

          // backgroundColor:
          // MaterialStateProperty.all<Color>(Colors.pink),
          fixedSize: MaterialStateProperty.all<Size>(
              const Size.fromWidth(double.infinity)),
        ),
        child: (_isLoading)
            ?  CircularProgressIndicator(
          color: widget.loaderColor ?? Colors.black,
        )
            :  Text(widget.buttonText,
            style: TextStyle(color: widget.textColor??Colors.black)),
      ),
    )
     ;
  }
}
