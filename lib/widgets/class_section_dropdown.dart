import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'new_drop_down.dart';

class ClassSectionDropdown extends StatefulWidget {
  double maxWidth;
  bool horizontalDirection;
  bool disableSection ;
  final void Function(String? selectedClass, String? selectedSection) onSelect;

  ClassSectionDropdown({
    required this.maxWidth,
    required this.onSelect,
    this.disableSection = false,
    this.horizontalDirection = false
  });
  @override
  _ClassSectionDropdownState createState() => _ClassSectionDropdownState();
}

class _ClassSectionDropdownState extends State<ClassSectionDropdown> {
   String? selectedClass;
   String? selectedSection;
   bool isClassSelected = false;
   bool isSectionSelected = false;
   bool enableSectionDropDown = false;
   List<CustDropdownMenuItem> sectionDropdownItems = [];

   void _loadSectionItems(String selectedClass) {
     FirebaseFirestore.instance
         .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/classes')
         .doc(selectedClass)
         .collection('Sections')
         .get()
         .then((value) {
       sectionDropdownItems.clear();
       for (var sectionDoc in value.docs) {
         String sectionName = sectionDoc.id;
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
     return StreamBuilder<QuerySnapshot>(
       stream: FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/classes').snapshots(),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return Center(child: CircularProgressIndicator());
         }
         List<CustDropdownMenuItem> classDropdownItems = [];
         for (var classDoc in snapshot.data!.docs) {
           String className = classDoc.id;
           classDropdownItems.add(
             CustDropdownMenuItem(
               value: className,
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
                   setState(() {
                     selectedClass = value!;
                     selectedSection = null;
                   });
                   _loadSectionItems(selectedClass!);
                   widget.onSelect(selectedClass, selectedSection);
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
                   widget.onSelect(selectedClass, selectedSection);
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
                 setState(() {
                   selectedClass = value!;
                   selectedSection = null;
                   isClassSelected = true;
                   isSectionSelected = false;
                   // Reset section when class changes
                 });
// Load section items for the selected class
                 _loadSectionItems(selectedClass!);
                 widget.onSelect(selectedClass, selectedSection); // Callback to parent widget

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
                 widget.onSelect(selectedClass, selectedSection); // Callback to parent widget

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
