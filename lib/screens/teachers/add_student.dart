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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Add Student",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                formTextFields(hintText: "Enter Student Name"),
                Container(
                    width: MediaQuery.of(context).size.width*.9,
                    color: Colors.white,
                    // height: 200,
                    child: ClassSectionDropdown(maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedClass, selectedSection) {
                      var classs = selectedClass;
                      var sections = selectedSection;
                      // Use the selectedClass and selectedSection values here
                      print('Selected Class: $classs, Selected Section: $sections');
                    },)),
                // formTextFields(hintText: "Enter Student Class",iconData: Icons.class_),
                // formTextFields(hintText: "Enter Student Section",iconData: Icons.collections),
                formTextFields(hintText: "Enter Student Roll Number",iconData: Icons.numbers),
                formTextFields(hintText: "Enter Date Of Birth",iconData: Icons.date_range),
                formTextFields(hintText: "Enter Blood Group",iconData: Icons.water_drop),
                formTextFields(hintText: "Enter Emergency Contact",iconData: Icons.quick_contacts_dialer),
                formTextFields(hintText: "Enter Father's Name",iconData: Icons.male),
                formTextFields(hintText: "Enter Mother's Name",iconData: Icons.female),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: ()async {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
