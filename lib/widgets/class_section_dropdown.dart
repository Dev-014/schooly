import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:provider/provider.dart';

import '../bloc/generic_bloc.dart';
import '../modals/academic_service/academicService.pb.dart';
import 'new_drop_down.dart';

class ClassSectionDropdown extends StatefulWidget {
  double maxWidth;
  bool horizontalDirection;
  bool disableSection ;
  bool disableSubject;
  final void Function(String? selectedClass, String? selectedSection, String? classId,String subject) onSelect;

  ClassSectionDropdown({
    required this.maxWidth,
    required this.onSelect,
    this.disableSection = false,
    this.horizontalDirection = false,
    this.disableSubject = false
  });
  @override
  _ClassSectionDropdownState createState() => _ClassSectionDropdownState();
}

class _ClassSectionDropdownState extends State<ClassSectionDropdown> {
   String? selectedClass;
   String? selectedSection;
   String? selectedSubject;
   String? classId;
   bool isClassSelected = false;
   bool isSectionSelected = false;
   bool enableSectionDropDown = false;
   bool enableSubjectDropDown = false;
   List<CustDropdownMenuItem> sectionDropdownItems = [];
   List<CustDropdownMenuItem> subjectDropdownItems = [];

   var genericProvider;
   @override
   void initState() {

     genericProvider = Provider.of<GenericProvider>(context,listen: false);
     super.initState();
   }

   void _loadSubjectItems( {required String selectedClass,required String classId}) {
     GetService.getSubjects(token: genericProvider.sessionToken, classId: classId)
         .then((value) {
           print("List of subjects");
           print(value);
      subjectDropdownItems.clear();

       for (var i = 0; i< value!.length ; i++) {
         String subjectName = value[i].name;
         subjectDropdownItems.add(
           CustDropdownMenuItem(
             value: subjectName,
             child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(subjectName)),
           ),
         );
       }
       setState(() {
         enableSubjectDropDown =true;
       }); // Update the state to rebuild the widget with the new section items
     });
   }

   void _loadSectionItems( {required String selectedClass,required String classId}) {
     GetService.getSections(token: genericProvider.sessionToken, classId: classId)
         .then((value) {
       sectionDropdownItems.clear();

       for (var i = 0; i< value!.length ; i++) {
         String sectionName = value[i].name;
         sectionDropdownItems.add(
           CustDropdownMenuItem(
             child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(sectionName)),
             value: sectionName,
           ),
         );
       }
       setState(() {
         enableSectionDropDown =true;
       }); // Update the state to rebuild the widget with the new section items
     });
   }
  @override
  Widget build(BuildContext context) {
     return FutureBuilder<List<Class>>(
       future: GetService.getClasses(token: genericProvider.sessionToken),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return Center(child: CircularProgressIndicator());
         }
         List<CustDropdownMenuItem> classDropdownItems = [];
         for (var classDoc in snapshot.data!) {
           String className = classDoc.grade.toString();
           classDropdownItems.add(
             CustDropdownMenuItem(
               value: classDoc ,
               child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(className)),

             ),
           );
         }

         return widget.horizontalDirection? Row( // Use Row instead of Column for horizontal layout
           crossAxisAlignment: CrossAxisAlignment.start, // Adjust alignment as needed
           children: [
             Expanded(
               child: CustDropDown<String>(
                 borderRadius: 0,
                 borderWidth: 0,
                 maxWidth: widget.maxWidth,
                 items: classDropdownItems,
                 onChanged: (value) {
                   Class classs  = value as Class;
                   setState(() {
                     selectedClass = classs.grade.toString();
                     selectedSection = null;
                     // classId = classs.id;
                     classId = classs.grade.toString();
                   });
                   _loadSectionItems(selectedClass: selectedClass!, classId: classs.grade.toString());
                   widget.onSelect(selectedClass, selectedSection,classId,"");
                 },
                 hintText: "Select Class",
               ),
             ),
             SizedBox(width: 20), // Adjust spacing between dropdowns
             Expanded(
               child: CustDropDown<String>(
                 maxWidth: widget.maxWidth,
                 enabled: enableSectionDropDown,
                 items: sectionDropdownItems,
                 onChanged: (value) {

                   setState(() {
                     selectedSection = value;
                   });
                   widget.onSelect(selectedClass, selectedSection,classId,"");
                 },
                 hintText: "Select Section",
               ),
             ),
           ],
         ):Column(
           children: [
             CustDropDown<String>(

               borderRadius: 0,

               borderWidth: 0,
               maxWidth: widget.maxWidth,
               // value: selectedClass,
               items: classDropdownItems,
               onChanged: (value) {
                 Class classs  = value as Class;

                 setState(() {
                   selectedClass = classs.grade.toString()!;
                   selectedSection = null;
                   isClassSelected = true;
                   isSectionSelected = false;
                   classId = classs.grade.toString()!;
                   // classId = classs.id;
                   // Reset section when class changes
                 });
// Load section items for the selected class
                 _loadSubjectItems(selectedClass: selectedClass!, classId: classId??"");
                 _loadSectionItems(selectedClass: selectedClass!, classId: classId??"");
                 widget.onSelect(selectedClass, selectedSection,classId,""); // Callback to parent widget

               },
               hintText: "Select Class",
               // hint: Text('Select Class'),
             ),
             if(!isClassSelected)
               Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                   'Please select a class',
                   style: TextStyle(color: Colors.red),
                 ),
               ),
             SizedBox(height: 20),
             if(!widget.disableSection)
             CustDropDown<String>(
               maxWidth: widget.maxWidth,
               enabled: enableSectionDropDown,

               // value: selectedSection,
               items: sectionDropdownItems,
               onChanged: (value) {
                 setState(() {
                   selectedSection = value;
                   isSectionSelected = true;

                 });

// Load section items for the selected class
                 widget.onSelect(selectedClass, selectedSection,classId??"",""); // Callback to parent widget

               },
               hintText: "Select Section",

               // hint: Text('Select Section'),
             ),
             if (!isSectionSelected && !widget.disableSection)
             Align(
               alignment: Alignment.centerLeft,
               child: Text(
                 'Please select a section',
                 style: TextStyle(color: Colors.red),
               ),
             ),
            if(!widget.disableSubject)
              Padding(
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
                          widget.onSelect(selectedClass,selectedSection,classId,selectedSubject!); // Callback to parent widget

                        },
                        hintText: "Select Subject",
                        // hint: Text('Select Class'),
                      ),]
                ),
              )

           ],
         );
       },
     );

  }
}

// return StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/classes').snapshots(),
//   builder: (context, snapshot) {
//     if (!snapshot.hasData) {
//       return CircularProgressIndicator();
//     }
//     List<DropdownMenuItem<String>> classDropdownItems = [];
//     List<DropdownMenuItem<String>> sectionDropdownItems = [];
//     for (var classDoc in snapshot.data!.docs) {
//       String className = classDoc.id;
//       classDropdownItems.add(
//         DropdownMenuItem(
//           child: Text(className),
//           value: className,
//         ),
//       );
//       if (selectedClass == className) {
//         print("????????????");
//         print(classDoc.id);
//          FirebaseFirestore.instance
//             .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/classes')
//             .doc(classDoc.id)
//             .collection('Sections')
//             .get().then((value) {
//
//           var sectionSnapshot =  value.docs;
//           print(">>>>>>>>>>>>");
//           print(sectionSnapshot);
//           for (var sectionDoc in sectionSnapshot) {
//             String sectionName = sectionDoc.id;
//             sectionDropdownItems.add(
//               DropdownMenuItem(
//                 child: Text(sectionName),
//                 value: sectionName,
//               ),
//             );
//           }
//         });
//
//       }
//     }
//     return Column(
//       children: [
//         DropdownButton<String>(
//           value: selectedClass,
//           items: classDropdownItems,
//           onChanged: (value) {
//             setState(() {
//               print(">>>>>>>>>");
//               selectedClass = value!;
//               selectedSection = null; // Reset section when class changes
//             });
//           },
//           hint: Text('Select Class'),
//         ),
//         SizedBox(height: 20),
//         DropdownButton<String>(
//
//           value: selectedSection,
//           items: sectionDropdownItems,
//           onChanged: (value) {
//             setState(() {
//               selectedSection = value;
//             });
//           },
//           hint: Text('Select Section'),
//         ),
//       ],
//     );
//   },
// );
