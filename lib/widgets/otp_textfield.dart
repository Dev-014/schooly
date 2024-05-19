import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;

  const OTPInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 5; i++) _buildInputSquare(i, context),
      ],
    );
  }

  Widget _buildInputSquare(int index, BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: TextField(
        controller: TextEditingController(text: ''),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            // Get the current selection.
            TextSelection selection = controller.selection;

            // Calculate the start and end indices of the new selection.
            int newStart = selection.start + 1;
            int newEnd = selection.end + 1;

            // Set the new selection.
            controller.selection = TextSelection(
              baseOffset: newStart,
              extentOffset: newEnd,
            );

            // Insert the new character into the text.
            controller.text = controller.text.substring(0, newStart) +
                value +
                controller.text.substring(newEnd);

            // Move to the next input square.
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
