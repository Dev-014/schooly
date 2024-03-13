import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:practice/common_widgets/drop_down_button.dart';
import 'package:practice/common_widgets/new_drop_down.dart';
import 'package:practice/utils/constants_colors.dart';

import '../../common_widgets/form_textfield.dart';

class StudyMaterialForm extends StatefulWidget {
  const StudyMaterialForm({super.key});

  @override
  State<StudyMaterialForm> createState() => _StudyMaterialFormState();
}

class _StudyMaterialFormState extends State<StudyMaterialForm> {
  final List<String> items = [
    'Science',
    'Maths',
    'Social Science',
    'English',
    "Hindi"
    // 'Item5',
    // 'Item6',
    // 'Item7',
    // 'Item8',
  ];
  // List<String> myItems = ["Option 1", "Option 2", "Option 3"];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xffe5e8ff).withOpacity(1),
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Study Material",
              style: TextStyle(fontSize: 18),
            )),
        // backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            formTextFields(hintText: "Class", iconData: Icons.group),
            CustDropDown(
              hintText: "Subject",
                items: [
                  CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Science"))),
                  CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Social Science"))),
                  CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Maths"))),
                  CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("English"))),
                ],
                onChanged: (){}),
            formTextFields(
                hintText: "Section", iconData: Icons.hotel_class_outlined),
            formTextFields(hintText: "Subject", iconData: Icons.book),
            formTextFields(
                hintText: "Assignment", maxLine: 4, iconData: Icons.assignment),
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.attach_file_outlined),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Attach Study Material"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the value as needed
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
