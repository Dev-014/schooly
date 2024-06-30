import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../modals/academic_service/academicService.pb.dart';
import '../../../services/get_service /get_service.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/homework_card.dart';

class ViewAnnouncement extends StatefulWidget {
  const ViewAnnouncement({super.key});

  @override
  State<ViewAnnouncement> createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> {

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    var announcement = GetService.getAnnouncement(token: genericProvider.sessionToken,context: context,);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FetchAnnouncementResponse?>(
        future: GetService.getAnnouncement(token: genericProvider.sessionToken,context: context),
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

                        itemCount: snapshot.data?.announcements.length,
                        itemBuilder: (context, index) {
                          Announcement? announcement = snapshot.data?.announcements[index];
                          //
                          // Map<String, dynamic> map = listOfMap![index];
                          // final homework_heading = map["title"];
                          // final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: announcement!.title,status: true, date: DateTime.fromMicrosecondsSinceEpoch(announcement.timestamp.toInt()).toString(),),
                          );
                        }),
                  ),
                ]
            ),
          );
        });
  }
}
