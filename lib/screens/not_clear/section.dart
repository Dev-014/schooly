import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/academic_service/academicService.pbenum.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/widgets/loader_button.dart';
import 'package:practice/widgets/new_drop_down.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';

class AddSectionPage extends StatefulWidget {
  const AddSectionPage({super.key});

  @override
  State<AddSectionPage> createState() => _AddSectionPageState();
}

class _AddSectionPageState extends State<AddSectionPage> {

  @override
  Widget build(BuildContext context) {
    return const StudentWrapper(widget: AddSection(), title: "Add Sections");
  }
}

class AddSection extends StatefulWidget {
  const AddSection({super.key});

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  List<String> sections = ["A","B","C","D","E","F","G","H","I","G","E"];
  List<String> classs = ["1","2","3","4","5","6","7","8","9","10","11","12",];
  List<CustDropdownMenuItem> sectionDropDownList = [];
  List<CustDropdownMenuItem> classDropDownList = [];

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

    // TODO: implement initState
    for( var section in sections){
      sectionDropDownList.add(CustDropdownMenuItem(value: section, child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(section))));
    }
    for( var classe in classs){
      classDropDownList.add(CustDropdownMenuItem(value: classe, child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(classe))));
    }
    super.initState();
  }
  String? section;
  String? clazz;
  SectionType selectedType = SectionType.ALL;
  var groupValue = 0;
  bool disableClassDropDown = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(
                            horizontal: 8), child:
                        Text("All",
                          // style: TextStyle(color: Colors.white),
                        ),
                        ),
                        Radio(
                          value: 0,
                          groupValue: groupValue,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                              disableClassDropDown =false;
                              selectedType = SectionType.ALL;


                            });
                          },
                        )],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(
                            horizontal: 8), child:
                        Text("Class",
                          // style: TextStyle(color: Colors.white),
                        ),
                        ),
                        Radio(
                            value: 1,
                            groupValue: groupValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                                disableClassDropDown =true;
                                selectedType = SectionType.GRADE;


                              }
                              );
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
                child: CustDropDown(items: sectionDropDownList, onChanged: (value){
                  section = value;

                },hintText: "Select Section",),
              ),


              if(disableClassDropDown)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
                  child: CustDropDown(items: classDropDownList, onChanged: (value){
                    setState(() {
                      clazz = value!;


                    });
                  },hintText: "Select Class",),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                child: LoaderElevatedButton(buttonText: "Add Section", onPressed: ()async{
                  print("SectionTYpe $selectedType");
                  print("section $section");
                 AddService.addSections(section: Section(type: selectedType!, name : section),token: genericProvider.sessionToken);
                },),
              ),
            ]

                ),
        ),
    ),
    );
  }
}
