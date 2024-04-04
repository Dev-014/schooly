import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:practice/common_widgets/drop_down_button.dart';
import 'package:practice/common_widgets/new_drop_down.dart';
import 'package:practice/utils/constants_colors.dart';

import '../../common_widgets/homework_card.dart';

class HomeWorkForm extends StatefulWidget {
  const HomeWorkForm({super.key});

  @override
  State<HomeWorkForm> createState() => _HomeWorkFormState();
}

class _HomeWorkFormState extends State<HomeWorkForm> {

  Future<void> addHomeWork({
    required String subjectId,
    required String classId,
    required String sectionId,
    required String title,
    required String fileUrl,
    required String teacherUid,
    bool isForAllSections = false,
  }) async {
    final firestore = FirebaseFirestore.instance;
    Map<String, dynamic> materialData = {
      'title': title,
      'fileUrl': fileUrl,
      'uploadedBy': teacherUid,
      'subjectId': subjectId,
      'status': false
    };

    // Add the material data to the study_materials collection
    await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works').doc("newMaterialIds11_teacher_Uid").set(materialData);

    print('Material IDs updated successfully!');
  }

  Future<List<Map<String, dynamic>>> getHomeworkListForClassAndSection(
      {String? classNumber, String? section}) async {
    List<Map<String, dynamic>> homeworkList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works')
        .where('class', isEqualTo: classNumber)
        .where('section', isEqualTo: section)
        .get();

    querySnapshot.docs.forEach((doc) {
      print("MMMMMMMMM");
      print(doc);
      Map<String, dynamic> homeworkItem = {
        'HomeworkID': doc.id,
        'subject': doc['subject'],
        'title': doc['title'],
        'status': doc['status']
      };
      homeworkList.add(homeworkItem);
    });
    print("object");
    print(homeworkList);
    return homeworkList;
  }

  final List<String> items = [
    'Section A',
    'Section B',
    'Section C',
    'Section D',
    // 'Item5',
    // 'Item6',
    // 'Item7',
    // 'Item8',
  ];
  // List<String> myItems = ["Option 1", "Option 2", "Option 3"];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xffe5e8ff).withOpacity(1),
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
                "Homework",
                style: TextStyle(fontSize: 18),
              )),
          bottom: PreferredSize(

            preferredSize: Size(0,55),
            child: Material(
              color: Colors.white,
              // color: ConstantColors.backGroundColor,
              child: const TabBar(
                  labelColor: Colors.black,
                  dividerColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: "UPLOAD HOMEWORK",),
                    Tab(text: "VIEW UPLOADED")
                  ]),
            ),
          ),

          // backgroundColor: Colors.pink,
        ),
        body: TabBarView(

          children: [
            Container(
              height: MediaQuery.of(context).size.height*.9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // applyLeaveTextField(suffix: false, hintText: "Class", headingText: "Class"),
                    // applyLeaveTextField(suffix: false, hintText: "Section", headingText: "Sections"),
                    // applyLeaveTextField(suffix: false, hintText: "Assignment", headingText: "Assignment"),
                    // applyLeaveTextField(suffix: false, hintText: "Study Material", headingText: "Study Material"),
                    // applyLeaveTextField(suffix: false, hintText: "Enter comment here", headingText: "Reason"),
                    // applyLeaveTextField(suffix: false, hintText: "Enter comment here", headingText: "Reason"),

                    homeWorkTextFields(hintText: "Class", iconData: Icons.group),


                    // CustDropDown(
                    //     hintText: "Sections",
                    //     items: [
                    //       CustDropdownMenuItem(value: "value",
                    //           child: Container(height: 50,
                    //               alignment: Alignment.centerLeft,
                    //               decoration: BoxDecoration(borderRadius: BorderRadius
                    //                   .circular(14), color: Colors.grey.withOpacity(
                    //                   .0)),
                    //               child: Text("Custom"))),
                    //       CustDropdownMenuItem(value: "value",
                    //           child: Container(height: 50,
                    //               alignment: Alignment.centerLeft,
                    //               decoration: BoxDecoration(borderRadius: BorderRadius
                    //                   .circular(14), color: Colors.grey.withOpacity(
                    //                   .0)),
                    //               child: Text("New Item"))),
                    //     ],
                    //     onChanged: () {}),


                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: MyDropdownButton(
                    //     items: items,
                    //     hint: "Select an option",
                    //     selectedValue: "Option 2",
                    //     onChanged: (value) => print("Selected value: $value"),
                    //     dropdownColor: Colors.red[200]!,
                    //     textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                    //     // isExpanded: true,
                    // ),
                    //   ),
                    //
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                    //         child: DropdownButtonHideUnderline(
                    //           child: DropdownButton2<String>(
                    //             isExpanded: true,
                    //             hint: const Row(
                    //               children: [
                    //                 Icon(
                    //                   Icons.list,
                    //                   size: 24,
                    //                   color: Colors.grey,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 8,
                    //                 ),
                    //                 Expanded(
                    //                   child: Text(
                    //                     'Sections',
                    //                     style: TextStyle(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.grey,
                    //                     ),
                    //                     overflow: TextOverflow.ellipsis,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             items: items
                    //                 .map((String item) => DropdownMenuItem<String>(
                    //                       value: item,
                    //
                    //                       child: Text(
                    //                         item,
                    //                         style: const TextStyle(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.bold,
                    //                           color: Colors.black,
                    //                         ),
                    //                         overflow: TextOverflow.ellipsis,
                    //                       ),
                    //                     ))
                    //                 .toList(),
                    //             value: selectedValue,
                    //             onChanged: (String? value) {
                    //               setState(() {
                    //                 selectedValue = value;
                    //               });
                    //             },
                    //             buttonStyleData: ButtonStyleData(
                    //               height: 50,
                    //               width: double.infinity,
                    //               padding: const EdgeInsets.only(left: 14, right: 14),
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(14),
                    //                 border: Border.all(
                    //                   color: Colors.white.withOpacity(.15),
                    //                 ),
                    //                 color: Colors.white,
                    //               ),
                    //               elevation: 1,
                    //             ),
                    //             iconStyleData: const IconStyleData(
                    //               icon: Icon(
                    //                 Icons.arrow_forward_ios_outlined,
                    //               ),
                    //               iconSize: 14,
                    //               iconEnabledColor: Colors.black,
                    //               iconDisabledColor: Colors.grey,
                    //             ),
                    //             dropdownStyleData: DropdownStyleData(
                    //
                    //               maxHeight: 200,
                    //               width: MediaQuery.of(context).size.width*.9,
                    //               decoration: BoxDecoration(
                    //
                    //                 borderRadius: BorderRadius.circular(14),
                    //                 color: Colors.white,
                    //               ),
                    //               offset: const Offset(4, -2),
                    //               scrollbarTheme: ScrollbarThemeData(
                    //                 radius: const Radius.circular(40),
                    //                 thickness: MaterialStateProperty.all<double>(6),
                    //                 thumbVisibility: MaterialStateProperty.all<bool>(true),
                    //               ),
                    //             ),
                    //             menuItemStyleData: const MenuItemStyleData(
                    //               height: 40,
                    //               padding: EdgeInsets.only(left: 14, right: 14),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    homeWorkTextFields(
                        hintText: "Section", iconData: Icons.hotel_class_outlined),
                    homeWorkTextFields(hintText: "Subject", iconData: Icons.book),
                    homeWorkTextFields(
                        hintText: "Assignment", maxLine: 4, iconData: Icons.assignment),
                    InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.attach_file_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Attach Study Material"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              addHomeWork(subjectId: "hindi", classId: '10', sectionId: "A", title: "chapter : 10", fileUrl: "fileUrl", teacherUid: "teacherUid");
                            },
                            child: Text("Submit"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the value as needed
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
                future: getHomeworkListForClassAndSection(classNumber: "10",section: "A"),
                builder: (BuildContext context, snapshot) {
                  return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):Column(

                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                          child: Align(alignment: Alignment.centerLeft,
                              child: Text("Today",
                                style: TextStyle(fontSize: 20,
                                  // color: Colors.pink,
                                ),)),
                        ),
                        Container(
                          height: 550,
                          width: 400,
                          child: ListView.builder(
                              shrinkWrap: true,

                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final listOfMap = snapshot.data;
                                print("MMMNNNNNNNVVVVV");
                                print(listOfMap);
                                Map<String, dynamic> map = listOfMap![index];
                                final homework_heading = map["title"];
                                final status = map["status"];
                                return  Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 10),
                                  child: HomeWorkCard(title: homework_heading,status:status, date: "English / Today",),
                                );
                              }),
                        ),
                      ]
                  );
                }),
          ],
        ),

      ),
    );
  }

  Padding homeWorkTextFields(
      {required String hintText,
      int? maxLine,
      IconData? iconData,
      bool? enabled}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: Text(hintText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 2),),
          // ),

          Material(
            elevation: 6, // You can adjust the elevation as needed
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: TextField(
              maxLines: maxLine ?? 1,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: hintText,
                fillColor: Colors.grey.withOpacity(.15),
                focusColor: Colors.grey.withOpacity(.15),
                filled: true,
                enabled: enabled ?? true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.15), width: 2),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.15), width: 2),
                    borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.15), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(iconData ?? Icons.person),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Padding applyLeaveTextField({required String hintText, required String headingText, bool suffix=true}) {

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(bottom: 0.0),
          child: Text(headingText, style: TextStyle(
              color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: TextField(
            decoration: InputDecoration(

              hintText:hintText,

              suffixIcon:  IconButton(onPressed: (){},icon: Icon(Icons.calendar_month,color: suffix?Colors.black87:Colors.transparent,)),

            ),
          ),
        )
      ],
    ),
  );
}
