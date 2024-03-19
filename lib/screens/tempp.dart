import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/common_widgets/take_attendance_card.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';

import '../modals/student.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  List<Student> students = [];
  int? totalClasses ;
  Future<List<QueryDocumentSnapshot<Object?>>>? documentSnap;

  List<Student> getListOfStudents(List<dynamic> listOfStudents){
    List<Student> list = [];
    listOfStudents.forEach((student) {
      Student student1 = Student(
        studentName: student["student_name"] ?? '',
        classs: student["classs"] ?? '',
        section: student["Section"],
        rollNumber: student["roll_number"],
        scholarId: student["scholar_id"],
        email:  student["email_id"]
      );
     list.add(student1);
    });
    return list;
  }

  void updateAttendance(String studentID, int? attendedClass) {
    var attendedClasss = attendedClass! + 1;
    print(attendedClasss);
    print("???????????");
    FirebaseFirestore.instance.collection("NewSchool").doc("G0ITybqOBfCa9vownMXU").collection("attendence").doc("y2Yes9Dv5shcWQl9N9r2").collection("attendance ").doc(studentID).update({
        "attendance.${DateTime.now().toUtc().millisecondsSinceEpoch}": "present"



    }).then((value) {
      FirebaseFirestore.instance.collection("NewSchool").doc("G0ITybqOBfCa9vownMXU").collection("attendence").doc("y2Yes9Dv5shcWQl9N9r2").collection("attendance ").doc("scholar_id").update({
        "attended_classes": attendedClasss
      });

      print('Student updated successfully');
    }).catchError((error) {
      print('Error updating student: $error');
    });
  }

 Future<int?> getTotalClasses()async {
   DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("NewSchool").doc("G0ITybqOBfCa9vownMXU").collection("attendence").doc("y2Yes9Dv5shcWQl9N9r2").collection("classes").doc("class_id_10thC").get();
   if (documentSnapshot.exists) {
     // Document exists, get the value of total_classes
      totalClasses = documentSnapshot.get('total_classes');
     print('Total Classes: $totalClasses');

     // Do something with the total_classes value
   } else {
     print('Document does not exist');
   }
   return totalClasses;
  }

  Future<List<QueryDocumentSnapshot<Object?>>> _fetchData() async {
    // Construct the collection path
    String collectionPath = 'NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance ';

    // Get the collection reference
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(collectionPath);

    // Fetch the documents in the collection
    QuerySnapshot<Object?> querySnapshot = await collectionReference.get();
    print("???????????");
    print(querySnapshot.docs[1]["attended_classes"]);

    // Return the list of documents
    return querySnapshot.docs;
  }

  // Future<int> fetchData(String scholar_id) async {
  //   try {
  //     // Construct the document path using collection and document IDs
  //     var documentPath = 'NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/attendance/${scholar_id}';
  //
  //     // Access the document using the constructed path
  //     var documentSnapshot = await FirebaseFirestore.instance.doc(documentPath).get();
  //     var attended_class = documentSnapshot["attended_classes"];
  //     if (documentSnapshot.exists) {
  //       // Document exists, get the data
  //       var totalClasses = documentSnapshot.get('total_classes');
  //       print('Total Classes: $totalClasses');
  //       return attended_class;
  //       // Do something with the total_classes value
  //     } else {
  //       print('Document does not exist');
  //       return 0;
  //     }
  //   } catch (e) {
  //     print('Error retrieving data: $e');
  //     return 0;
  //
  //   }
  // }
var genericProvider;
  @override
  void initState() {

    getTotalClasses();
    // documentSnap = _fetchData();
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    genericProvider.fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      // appBar: AppBar(
      //   title: Text("Take Attendance"),
      // ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("NewSchool").doc("G0ITybqOBfCa9vownMXU").collection("attendence").doc("y2Yes9Dv5shcWQl9N9r2")
              .collection('students')
              .where('class', isEqualTo: FirebaseFirestore.instance.collection("NewSchool").doc("G0ITybqOBfCa9vownMXU").collection("attendence").doc("y2Yes9Dv5shcWQl9N9r2").collection('classes').doc("class_id_10thC"))
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if(snapshot.hasData){
              print(">>>>>>>");
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              students = getListOfStudents(documents);
            }

            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                print("????????>>><<<");
                var attendenceList =  genericProvider.attendance;
                var attended_class = attendenceList[index]["attended_classes"];
                print("_______==========");
                return
                  TakeAttendanceCard(
                    students[index].scholarId!,
                    students[index].email!,
                      students[index].studentName,
                    attended_class,
                    totalClasses?? 90,
                    attended_class, () {
                      // print("++++++++===========");
                      // updateAttendance(students[index].scholarId!);
                  },
                          () {
                            print("++++++++===========");
                            updateAttendance(students[index].scholarId!,attended_class);
                          }, () {

                  }, () {});
              }

            );
  }
  )
    );
  }
}
///TODO: We can set total number of classes before.