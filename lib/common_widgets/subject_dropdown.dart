import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'new_drop_down.dart';

class SubjectDropdown extends StatefulWidget {
  double maxWidth;
  final void Function(String? selectedSubject) onSelect;


  SubjectDropdown({
    required this.maxWidth,
    required this.onSelect,
  });
  @override
  _SubjectDropdownState createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/subjects').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<CustDropdownMenuItem> subjectDropdownItems = [];
        for (var subjectDoc in snapshot.data!.docs) {
          print("<<<<<<<<<object>>>>>>>>>");
          print(subjectDoc.id);
          String subjectName = subjectDoc.id;
          subjectDropdownItems.add(
            CustDropdownMenuItem(
              value: subjectName,
              child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(subjectName)),

            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              CustDropDown<String>(

              borderRadius: 0,

              borderWidth: 0,
              maxWidth: widget.maxWidth,
              // value: selectedClass,
              items: subjectDropdownItems,
              onChanged: (value) {
                setState(() {
                  selectedSubject = value!;
                  // Reset section when class changes
                });
                widget.onSelect(selectedSubject); // Callback to parent widget

              },
              hintText: "Select Subject",
              // hint: Text('Select Class'),
            ),]
          ),
        );
      },
    );

  }
}

