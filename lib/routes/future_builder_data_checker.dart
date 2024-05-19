import 'package:flutter/material.dart';

Widget? futureBuilderDataCheck(
    {required AsyncSnapshot snapshot, required BuildContext context}) {
  if (snapshot.hasError) {
    if (snapshot.error == "noUserFound") {
      return MaterialApp(home: Center(child: Text("noUserFound")));
    }
    return MaterialApp(home: Center(child: Text("somethingWentWrong")));
  }

  if (!snapshot.hasData) {
    return MaterialApp(
      home: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          )),
    );
  }

  return null;
}
