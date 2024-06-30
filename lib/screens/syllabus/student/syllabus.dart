import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/modals/student.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:practice/widgets/report_card_viewer.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../../modals/user_service/userService.pb.dart';

class SyllabusPage extends StatefulWidget{

  @override
  State<SyllabusPage> createState() => _SyllabusPageState();
}
class _SyllabusPageState extends State<SyllabusPage>{
  List<String> listOfSubjects = [];


  Future<List<Map<String, dynamic>>> getListOfSubjects({required String classId}) async {
    List<Map<String, dynamic>> listOfSyllabus =[] ;


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/syllabus/$classId/Syllab')
        .get();

    querySnapshot.docs.forEach((doc) {
      print("MMMMMMMMM");
      print(doc);
      Map<String, dynamic> syllabusItem = {
        'subject_name': doc['subject_name'],
        'syllabus_url': doc['syllabus_url'],
      };
      listOfSubjects.add(doc.id);
      listOfSyllabus.add(syllabusItem);

    });

    print("object");
    print(listOfSubjects);
    return listOfSyllabus;
  }
  Student? loggedInStudent;
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    loggedInStudent = genericProvider.student;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context ) {

    var reportCards;
    String className;
    String report_card_link;
    return StudentWrapper(widget: FutureBuilder<FetchSyllabusResponse>(
        future: GetService.getSyllabus(token: genericProvider.sessionToken, context: context),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){

          }
          return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()): Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
                children:
                [
                  Container(
                    height: MediaQuery.of(context).size.height*.7,
                    child:
                    ListView.builder(
                      itemCount: snapshot.data!.syllabus.length,
                      itemBuilder: (context,index){
                        return  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: InkWell(
                                onTap: (){
                                  // final fileUrl = snapshot.data![index]["syllabus_url"];
                                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                                  //   return ReportCardViewer(fileUrl: fileUrl,);
                                  // }));
                                },
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      Text(snapshot.data?.syllabus[index].name ?? "",style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black87
                                      ),),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.pink,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(thickness: 0.2,color: Colors.grey,),
                            )
                          ],
                        );
                      },

                    ),
                  )
                ]
            ),
          );
        }), title: "Syllabus");
  }
}
