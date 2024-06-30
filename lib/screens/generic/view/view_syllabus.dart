import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../modals/academic_service/academicService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/homework_card.dart';

class ViewSyllabus extends StatefulWidget {
  const ViewSyllabus({super.key});

  @override
  State<ViewSyllabus> createState() => _ViewSyllabusState();
}

class _ViewSyllabusState extends State<ViewSyllabus> {

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    var syllabus = GetService.getSyllabus(token: genericProvider.sessionToken,context: context,);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FetchSyllabusResponse?>(
        future: GetService.getSyllabus(token: genericProvider.sessionToken,context: context),
        builder: (BuildContext context, snapshot) {
          return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: Column(

                children: [
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  //   child: Align(alignment: Alignment.centerLeft,
                  //       child: Text("Today",
                  //         style: TextStyle(fontSize: 20,
                  //         ),)),
                  // ),
                  Container(
                    height: 550,
                    width: 400,
                    child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: snapshot.data?.syllabus.length,
                        itemBuilder: (context, index) {
                          Syllabus? syllabus = snapshot.data?.syllabus[index];
                          //
                          // Map<String, dynamic> map = listOfMap![index];
                          // final homework_heading = map["title"];
                          // final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: syllabus!.name,status: true, date: syllabus.classId),
                          );
                        }),
                  ),
                ]
            ),
          );
        });
  }
}
