import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/form_textfield.dart';

import '../../common_widgets/class_section_dropdown.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({super.key});

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  var classs;
  var section;

  Future<void> addStudent(
      {required String scholarId,
      required String name,
      required String classs,
      required String section,
      required String rollNumber,
      required String dob,
      required String bloodGroup,
      required String emergencyContact,
      required String emailId,
      required String fathersName,
      required String mothersName}) async {
    final firestore = FirebaseFirestore.instance;
    final studentsRef = firestore
        .collection(
            '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/students')
        .doc(scholarId);
    final classRef = firestore.collection(
        "NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/classes/$classs/Sections/"); // Path to create/get class document (replace with your logic)
    final classId = classRef.doc(section);
    // Create a map with student data
    final studentData = {
      'student_name': name,
      'classs': classs,
      'class': classId,
      'email_id': emailId,
      'Section': section, // Assuming class and section are combined in a single field
      'roll_number': rollNumber,
      'dateOfBirth': dob,
      'bloodGroup': bloodGroup,
      'emergencyContact': emergencyContact,
      'fathersName': fathersName,
      'mothersName': mothersName,
      'scholar_id': scholarId
    };

    await studentsRef.set(studentData);

    print("Student added successfully!");
  }

  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();
  TextEditingController _textController6 = TextEditingController();
  TextEditingController _textController7 = TextEditingController();
  TextEditingController _textController8 = TextEditingController();
  TextEditingController _textController9 = TextEditingController();

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();
    _textController6.dispose();
    _textController7.dispose();
    _textController8.dispose();
    _textController9.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Add Student",
              style: TextStyle(fontSize: 18),
            )),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                formTextFields(
                    hintText: "Enter Student Name",
                    textEditingController: _textController1),
                Container(
                    child: ClassSectionDropdown(
                  maxWidth: MediaQuery.of(context).size.width * .81,
                  onSelect: (selectedClass, selectedSection) {
                    classs = selectedClass;
                    section = selectedSection;
                  },
                )),
                formTextFields(
                    hintText: "Scholar Id",
                    iconData: Icons.perm_identity,
                    textEditingController: _textController2),
                formTextFields(
                    hintText: "Enter Student Roll Number",
                    iconData: Icons.numbers,
                    textEditingController: _textController3),
                formTextFields(
                    hintText: "Enter Date Of Birth",
                    iconData: Icons.date_range,
                    textEditingController: _textController4),
                formTextFields(
                    hintText: "Enter Email Id",
                    iconData: Icons.email,
                    textEditingController: _textController9),
                formTextFields(
                    hintText: "Enter Blood Group",
                    iconData: Icons.water_drop,
                    textEditingController: _textController5),
                formTextFields(
                    hintText: "Enter Emergency Contact",
                    iconData: Icons.quick_contacts_dialer,
                    textEditingController: _textController6),
                formTextFields(
                    hintText: "Enter Father's Name",
                    iconData: Icons.male,
                    textEditingController: _textController7),
                formTextFields(
                    hintText: "Enter Mother's Name",
                    iconData: Icons.female,
                    textEditingController: _textController8),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () async {
                        addStudent(
                            scholarId: _textController2.text,
                            name: _textController1.text,
                            classs: classs,
                            section: section,
                            rollNumber: _textController3.text,
                            dob: _textController4.text,
                            bloodGroup: _textController5.text,
                            emergencyContact: _textController6.text,
                            fathersName: _textController7.text,
                            mothersName: _textController8.text,
                            emailId: _textController9.text);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
