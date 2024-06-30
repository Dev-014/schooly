import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../modals/academic_service/academicService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/homework_card.dart';

class ViewHomework extends StatefulWidget {
  const ViewHomework({super.key});

  @override
  State<ViewHomework> createState() => _ViewHomeworkState();
}

class _ViewHomeworkState extends State<ViewHomework> {

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    var homework = GetService.getHomework(token: genericProvider.sessionToken,context: context,);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FetchHomeworksResponse?>(
        future: GetService.getHomework(token: genericProvider.sessionToken,context: context),
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

                        itemCount: snapshot.data?.homeworks.length,
                        itemBuilder: (context, index) {
                          Homework? homework = snapshot.data?.homeworks[index];
                          //
                          // Map<String, dynamic> map = listOfMap![index];
                          // final homework_heading = map["title"];
                          // final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: homework!.title,status: true, date: homework.subjectId,),
                          );
                        }),
                  ),
                ]
            ),
          );
        });
  }
}
