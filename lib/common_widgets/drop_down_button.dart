import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> items;
  final String hint;
  final String? selectedValue;
  final Function(String?) onChanged;
  final Color dropdownColor;
  final TextStyle? textStyle;
  final bool isExpanded;

  const MyDropdownButton({
    Key? key,
    required this.items,
    required this.hint,
    this.selectedValue,
    required this.onChanged,
    this.dropdownColor = Colors.white,
    this.textStyle,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem =  widget.items[0];
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.account_balance_sharp,color: Colors.black,),
        ),

        Container(
            width: 200,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(14)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(

              borderRadius: BorderRadius.circular(14),
              elevation: 4,
              alignment: AlignmentDirectional.centerEnd,
              decoration: InputDecoration(),
              // padding: EdgeInsets.all(16),

              hint: Text(widget.hint, style: widget.textStyle,),
              value: _selectedItem,
              isExpanded: widget.isExpanded,
              dropdownColor: widget.dropdownColor,
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(

                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(item, style: widget.textStyle),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedItem = value;
                  widget.onChanged(value);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
