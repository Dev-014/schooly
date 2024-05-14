import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common_methods/showSnackBar.dart';

class LoadingIconTextButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Future<dynamic> Function() onPressed;
   LoadingIconTextButton({required this.text,required this.icon,required this.onPressed,super.key});

  @override
  State<LoadingIconTextButton> createState() => _LoadingIconTextButtonState();
}

class _LoadingIconTextButtonState extends State<LoadingIconTextButton> {
  late Completer<dynamic> _completer;

  var _isLoading = false;
  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _toggleLoading();
        // Your upload/ submit method
        try {
          var result = await widget.onPressed();

          showSnackBar(text: "Uploaded", context: context);

          _completer.complete(result);

        } catch (error) {
          _completer.completeError(error);
          showSnackBar(text: error.toString(), context: context);
        } finally {
          _toggleLoading();
        }

      },
      child: (_isLoading)?
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Uploading...."),
            ),
          ],
        ),
      ):Row(

        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(widget.text),
          ),
        ],
      ),
    );

  }
}
