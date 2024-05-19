import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/utils/validators.dart';
import 'package:practice/widgets/showSnackBar.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../widgets/class_section_dropdown.dart';
import '../widgets/loader_button.dart';
import '../widgets/form_textfield.dart';

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
      'Section':
          section, // Assuming class and section are combined in a single field
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
    final _formKey = GlobalKey<FormState>();

    return StudentWrapper(widget: SizedBox(
      child: Form(
        autovalidateMode: AutovalidateMode.always, // Add this line

        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                formTextFields(
                    isRequired: true,
                    validator: Validator.validateName,
                    hintText: "Student Name",
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
                    isRequired: true,
                    hintText: "Scholar Id",
                    iconData: Icons.perm_identity,
                    validator: Validator.validateScholarId,
                    textEditingController: _textController2),
                formTextFields(
                    isRequired: true,
                    hintText: "Student Roll Number",
                    iconData: Icons.numbers,
                    validator: Validator.validateRollNumber,
                    textEditingController: _textController3),
                formTextFields(
                    isRequired: true,
                    hintText: "Date Of Birth",
                    iconData: Icons.date_range,
                    validator: Validator.validateDateOfBirth,
                    textEditingController: _textController4),
                formTextFields(
                    isRequired: true,
                    hintText: "Email Id",
                    validator: Validator.validateEmail,
                    iconData: Icons.email,
                    textEditingController: _textController9),
                formTextFields(
                    isRequired: true,
                    validator: Validator.validateBloodGroup,
                    hintText: "Blood Group",
                    iconData: Icons.water_drop,
                    textEditingController: _textController5),
                formTextFields(
                    isRequired: true,
                    validator: Validator.validateEmergencyContact,
                    hintText: "Emergency Contact",
                    iconData: Icons.quick_contacts_dialer,
                    textEditingController: _textController6),
                formTextFields(
                    isRequired: true,
                    validator: Validator.validateFathersName,
                    hintText: "Father's Name",
                    iconData: Icons.male,
                    textEditingController: _textController7),
                formTextFields(
                    isRequired: true,
                    validator: Validator.validateMothersName,
                    hintText: "Mother's Name",
                    iconData: Icons.female,
                    textEditingController: _textController8),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: LoaderElevatedButton(
                      onPressed: () async {
                        if (classs != null && section != null) {
                          if (_formKey.currentState!.validate()) {

                            await addStudent(
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
                          } else {
                            setState(() {
                              _formKey.currentState!.reset();
                            });
                          }

                          // else {
                          //   setState(() {
                          //     isClassSelected = selectedClass == null;
                          //     isSectionSelected = selectedSection == null;
                          //   });
                          // }
                        } else {
                          showSnackBar(
                              text: "Please select Class and Section",
                              context: context);
                        }

                        setState(() {
                          _formKey.currentState!.reset();
                          classs = null;
                          section = null;
                        });
                      },
                      // style: ElevatedButton.styleFrom(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      // ),
                      buttonText: "Submit",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ), title: "Add Student");
  }
}
