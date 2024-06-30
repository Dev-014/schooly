import 'package:flutter/material.dart';



class NewTempFormField extends StatefulWidget {
  NewTempFormField(
      {required this.hintText,
        this.maxLine,
        this.iconData,
        this.enabled,
        this.labelText,
        this.isRequired = false,
        this.validator,
        this.textEditingController,
        super.key});

  final String hintText;
  final int? maxLine;
  final IconData? iconData;
  final FormFieldValidator<String>? validator;
  final labelText;

  final bool? enabled;
  final TextEditingController? textEditingController;
  bool? isRequired ;

  @override
  State<NewTempFormField> createState() => _NewTempFormFieldState();
}

class _NewTempFormFieldState extends State<NewTempFormField> {
  String? _errorMessage = null;
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

          TextFormField(

            validator:  (value) {
              print("mkmkmkmkmkmkmkmkmkmkmkmkmkm");
              String? errorMessage = widget.validator?.call(value);
              print(errorMessage);
              setState(() {
                _errorMessage = errorMessage;
              });
              return errorMessage;
            },
            controller: widget.textEditingController,
            maxLines: widget.maxLine ?? 1,
            // onSaved: (value){
            //   print("mkmkmkmkmkmkmkmkmkmkmkmkmkm");
            //
            //   String? errorMessage = widget.validator!.call(value);
            //   print(errorMessage);
            //
            //   setState(() {
            //     _errorMessage = errorMessage;
            //
            //   });
            // },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Icon(widget.iconData ?? Icons.perm_identity),
              ),


              labelText: widget.labelText??"Enter",
              labelStyle: TextStyle(color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey),
              hintText: widget.isRequired!
                  ? widget.hintText + "*"
                  : widget.hintText,
              fillColor: Colors.white,
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
                      color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.15), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              // icon: Container(
              //   height: 40,
              //   decoration: BoxDecoration(
              //
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 0.0),
              //     child: Icon(widget.iconData ?? Icons.person),
              //   ),
              // ),
            ),
          ),
          // if (_errorMessage != null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 3.0),
          //     child: Text(
          //
          //       _errorMessage!,
          //       style: TextStyle(color: Colors.red),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
