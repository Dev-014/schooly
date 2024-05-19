import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../../../widgets/homework_card.dart';

class HomeWorkPage extends StatefulWidget {
  const HomeWorkPage({super.key});

  @override
  State<HomeWorkPage> createState() => _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  Future<List<Map<String, dynamic>>> getHomeworkListForClassAndSection(
      {String? classNumber, String? section}) async {
    List<Map<String, dynamic>> homeworkList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(
            '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/home_works')
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

  @override
  Widget build(BuildContext context) {
    return StudentWrapper(
      title: "Homework",
        widget: FutureBuilder<List<Map<String, dynamic>>>(
            future: getHomeworkListForClassAndSection(
                classNumber: "10", section: "A"),
            builder: (BuildContext context, snapshot) {
              return (!snapshot.hasData)
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 8),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Today",
                                  style: TextStyle(
                                    fontSize: 20,
                                    // color: Colors.pink,
                                  ),
                                )),
                          ),
                          Container(
                            height: 550,
                            width: 400,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  final listOfMap = snapshot.data;
                                  print(listOfMap);
                                  Map<String, dynamic> map = listOfMap![index];
                                  final homework_heading = map["title"];
                                  final status = map["status"];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 10),
                                    child: HomeWorkCard(
                                      title: homework_heading,
                                      status: status,
                                      date: map["subject"],
                                    ),
                                  );
                                }),
                          ),
                        ]),
                      ),
                    );
            }));
  }
}
