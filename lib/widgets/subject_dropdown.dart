import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:provider/provider.dart';

import '../bloc/generic_bloc.dart';
import '../services/get_service /get_service.dart';
import 'new_drop_down.dart';

class SubjectDropdown extends StatefulWidget {
  final double maxWidth;
  final void Function(String? selectedSubject) onSelect;
  final String classId;


  SubjectDropdown({
    required this.maxWidth,
    required this.onSelect,
    required this.classId
  });
  @override
  _SubjectDropdownState createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  String? selectedSubject;
  var genericProvider;
  @override
  void initState() {

    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Subject>?>(
      future: GetService.getSubjects(token: genericProvider.sessionToken, classId: widget.classId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<CustDropdownMenuItem> subjectDropdownItems = [];
        for (var subjectDoc in snapshot.data!) {
          print("<<<<<<<<<object>>>>>>>>>");
          print(subjectDoc.name);
          String subjectName = subjectDoc.name;
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

