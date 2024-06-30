import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../modals/academic_service/academicService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/homework_card.dart';

class ViewReportCard extends StatefulWidget {
  const ViewReportCard({super.key});

  @override
  State<ViewReportCard> createState() => _ViewReportCardState();
}

class _ViewReportCardState extends State<ViewReportCard> {

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    var reportCard = GetService.getReportCard(token: genericProvider.sessionToken,context: context,);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FetchReportCardResponse?>(
        future: GetService.getReportCard(token: genericProvider.sessionToken,context: context),
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

                        itemCount: snapshot.data?.reportCards.length,
                        itemBuilder: (context, index) {
                          ReportCard? reportCard = snapshot.data?.reportCards[index];
                          //
                          // Map<String, dynamic> map = listOfMap![index];
                          // final homework_heading = map["title"];
                          // final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: reportCard!.grade.toString(),status: true, date: reportCard.userId),
                          );
                        }),
                  ),
                ]
            ),
          );
        });
  }
}
