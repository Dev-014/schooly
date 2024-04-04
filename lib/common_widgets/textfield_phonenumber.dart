
import 'package:flutter/material.dart';

class TextFieldWithLabelAndCountryCode extends StatelessWidget {
  final String labelText;
  final String? countryCode;
  final TextEditingController controller;

  const TextFieldWithLabelAndCountryCode({

    Key? key,
    required  this.controller,
    required this.labelText,
    this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text field name.
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),

          Container(
            width: double.infinity,
            child: TextField(
              controller: controller,
              cursorColor: Colors.pink,
              decoration: (countryCode==null)
                  ? InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                  : InputDecoration(
                      prefixIcon: Text(
                        countryCode!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      prefixStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      border: InputBorder.none,
                      hintText: '999999999',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          // Text field.
          // Country code.
        ],
      ),
    );
  }
}
