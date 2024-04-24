import 'package:flutter/material.dart';
import 'package:practice/common_widgets/form_textfield.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
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
        title: const Align(alignment:Alignment.centerLeft,child: Text("Add Teacher",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                formTextFields(hintText: "Enter Teacher Name"),
                formTextFields(hintText: "Enter Teacher's Class",iconData: Icons.class_),
                formTextFields(hintText: "Enter Teacher's Section",iconData: Icons.collections),
                formTextFields(hintText: "Enter Teacher Emp Id",iconData: Icons.numbers),
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
