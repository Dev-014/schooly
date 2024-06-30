import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/generic_bloc.dart';
import '../modals/user_service/userService.pb.dart';
import '../modals/user_service/userService.pbenum.dart';
import '../services/add_service/add_service.dart';
import '../widgets/class_section_dropdown.dart';
import '../widgets/form_textfield.dart';
import '../widgets/showSnackBar.dart';


class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  var classs;
  var section;
  var classId;



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
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
              "Add Teacher",
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
                    hintText: "Enter Teacher Name",
                    textEditingController: _textController1),
                Container(
                    child: ClassSectionDropdown(
                      maxWidth: MediaQuery.of(context).size.width * .81,
                      onSelect: (selectedClass, selectedSection,classID,subject) {
                        classs = selectedClass;
                        section = selectedSection;
                      },
                    )),
                formTextFields(
                    hintText: "Emp Id",
                    iconData: Icons.perm_identity,
                    textEditingController: _textController2),
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
                        if (classs != null && section != null) {
                          // if (_formKey.currentState!.validate()) {
                            User user = User(
                              teacher: Teacher(
                                details: Details(
                                  id: _textController2.text,
                                  firstName: _textController1.text,
                                  lastName: _textController7.text,
                                  phoneNumber: _textController6.text,
                                  roles: 1,
                                ),
                                sectionId: section,
                                classId: classs,
                              ),
                              type: Types.TEACHER,
                            );
                            await AddService.addUser(
                                  token: genericProvider.sessionToken,
                                context: context,
                                user: user);
                            // await addStudent(
                            //     scholarId: _textController2.text,
                            //     name: _textController1.text,
                            //     classs: classs,
                            //     section: section,
                            //     rollNumber: _textController3.text,
                            //     dob: _textController4.text,
                            //     bloodGroup: _textController5.text,
                            //     emergencyContact: _textController6.text,
                            //     fathersName: _textController7.text,
                            //     mothersName: _textController8.text,
                            //     emailId: _textController9.text);
                          // }
                        // else {
                        //     setState(() {
                        //       _formKey.currentState!.reset();
                        //     });
                        //   }

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
