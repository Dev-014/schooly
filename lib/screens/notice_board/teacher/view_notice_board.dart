
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';

class TeacherNoticeView extends StatefulWidget {
  const TeacherNoticeView({Key? key}) : super(key: key);

  @override
  State<TeacherNoticeView> createState() => _TeacherNoticeViewState();
}

class _TeacherNoticeViewState extends State<TeacherNoticeView> {
  String mainClass = "";
  var genericProvider;
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    print(",,,,,,,,,,,,,,,,");
    print(genericProvider.empID);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FetchNoticesResponse>(
      future:GetService.getNoticeBoard(token: genericProvider.sessionToken, context: context),
      builder: (BuildContext context, future){
            if (future.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!future.hasData ||
                future.data == null) {
              return const Center(
                child: Text('No notice yet.'),
              );
            }





            List<Notice> allNotice =  future.data!.notices;

            // List<dynamic> filteredNotice = allNotice
            //     .where((leave) => (leave['class'] == mainClass || leave['class'] == "All"))
            //     .toList();
            //
            // if (filteredNotice.isEmpty) {
            //   return const Center(
            //     child: Text('No notice found'),
            //   );
            // }
            return ListView.builder(
              itemCount: allNotice.length,
              itemBuilder: (BuildContext context, int index) {
                // Map<String, dynamic> notice = filteredNotice[index];
                // DateTime date = (allNotice[index].createdAt as Timestamp).toDate();
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            allNotice[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: SizedBox(
                        //       height: 200,
                        //       width: 200,
                        //       child: Image.network(notice['imageSrc'])),
                        // ),
                        const SizedBox(height: 10),
                        Text(allNotice[index].content),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Class: ${allNotice[index].classId}'),
                            // 'Date: ${DateFormat('dd MMM yyyy').format(date)}'
                            Text(
                               "Date: ${allNotice[index].createdAt}"
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
  }
}
// TODO Implement this library.