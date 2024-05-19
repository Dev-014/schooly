import 'package:flutter/material.dart';



class formTextFields extends StatefulWidget {
  formTextFields(
      {required this.hintText,
      this.maxLine,
      this.iconData,
      this.enabled,
      this.isRequired = false,
      this.validator,
      this.textEditingController,
      super.key});

  final String hintText;
  final int? maxLine;
  final IconData? iconData;
  final FormFieldValidator<String>? validator;

  final bool? enabled;
  final TextEditingController? textEditingController;
  bool? isRequired = false;

  @override
  State<formTextFields> createState() => _formTextFieldsState();
}

class _formTextFieldsState extends State<formTextFields> {
  String? _errorMessage;
  double verticalPadding = 16;

  @override
  Widget build(BuildContext context) {
    // TextEditingController textEditingController = TextEditingController();


if(_errorMessage==null){
  verticalPadding =16;
}else{
  verticalPadding = 8;
}
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: verticalPadding ),
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
            child: TextFormField(
      //         validator:  (value) {
      //
      // String? errorMessage = widget.validator?.call(value);
      //
      // setState(() {
      // _errorMessage = errorMessage;
      // });
      // return errorMessage;
      // },
              controller: widget.textEditingController,
              maxLines: widget.maxLine ?? 1,
              onSaved: (value){
                String? errorMessage = widget.validator?.call(value);
                setState(() {
                  _errorMessage = errorMessage;

                });
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: widget.isRequired!
                    ? widget.hintText + "*"
                    : widget.hintText,
                fillColor: Colors.grey.withOpacity(.15),
                focusColor: Colors.grey.withOpacity(.15),
                filled: true,
                enabled: widget.enabled ?? true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.30),
                        width: 1),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.15), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.15), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(widget.iconData ?? Icons.person),
                ),
              ),
            ),
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(

                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
