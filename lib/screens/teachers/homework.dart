import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/common_widgets/drop_down_button.dart';
import 'package:practice/common_widgets/new_drop_down.dart';
import 'package:practice/common_widgets/subject_dropdown.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/class_section_dropdown.dart';
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
    // required String teacherUid,
    bool isForAllSections = false,
  }) async {
    final firestore = FirebaseFirestore.instance;
    Map<String, dynamic> materialData = {
      'title': title,
      'fileUrl': fileUrl,
      'emp_id': genericProvider.empID,
      'subject': subjectId,
      'class':classId,
      'section':sectionId,
      'status': false
    };

    // Add the material data to the study_materials collection
    await firestore.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works').doc().set(materialData);

    print('Material IDs updated successfully!');
  }

  Future<List<Map<String, dynamic>>> getHomeworkListForClassAndSection(
     ) async {
    List<Map<String, dynamic>> homeworkList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works')
        // .where('class', isEqualTo: classNumber)
        // .where('section', isEqualTo: section)
    .where("emp_id",isEqualTo: genericProvider.empID)
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
  var genericProvider;
  var subject;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();
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
            SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height*.95,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*.9,
                          color: Colors.white,
                          // height: 200,
                          child: ClassSectionDropdown(
                            maxWidth: MediaQuery.of(context).size.width*.84,
                            onSelect: (selectedClass, selectedSection) {
                              var classs = selectedClass;
                              var sections = selectedSection;
                              // Use the selectedClass and selectedSection values here
                              print('Selected Class: $classs, Selected Section: $sections');
                            },
                          ),
              
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*.9,
                          // color: Colors.white,
                          // height: 200,
                          child: SubjectDropdown(
                            maxWidth: MediaQuery.of(context).size.width*.84, onSelect: (selectedSubject) {
                             subject = selectedSubject;
                            // Use the selectedClass and selectedSection values here
                            print('Selected subject: $subject');
                          },)),
              

                      homeWorkTextFields(controller: _textController4,
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
                                addHomeWork(subjectId: subject, classId: _textController1.text, sectionId: _textController2.text, title: _textController4.text, fileUrl: "fileUrl");
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
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
                future: getHomeworkListForClassAndSection(),
                builder: (BuildContext context, snapshot) {
                  return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
                    child: Column(
                    
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                            child: Align(alignment: Alignment.centerLeft,
                                child: Text("Today",
                                  style: TextStyle(fontSize: 20,
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
                                    child: HomeWorkCard(title: homework_heading,status:status, date: map["subject"],),
                                  );
                                }),
                          ),
                        ]
                    ),
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
        TextEditingController? controller,
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
controller: controller,
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
