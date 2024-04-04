import 'package:flutter/material.dart';

Padding formTextFields(
    {required String hintText,
      int? maxLine,
      IconData? iconData,
      bool? enabled,
      TextEditingController? textEditingController
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Text(hintText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 2),),
        // ),

        Material(
          elevation: 6, // You can adjust the elevation as needed
          color: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: TextField(
            controller: textEditingController,
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: hintText,
              fillColor: Colors.grey.withOpacity(.15),
              focusColor: Colors.grey.withOpacity(.15),
              filled: true,
              enabled: enabled ?? true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 2),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 2),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(iconData ?? Icons.person),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
