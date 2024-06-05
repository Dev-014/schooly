import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:provider/provider.dart';

class ViewNoticeBoard extends StatefulWidget {
  final String title;
  const ViewNoticeBoard({super.key, required this.title});

  @override
  State<ViewNoticeBoard> createState() => _ViewNoticeBoardState();
}

class _ViewNoticeBoardState extends State<ViewNoticeBoard> {

  String docId = "";
  var genericProvider;
  String mainClass = "";
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    if (widget.title == "teacher") {
      docId = genericProvider.empID;
    } else {
      docId = genericProvider.scholarId;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("123455"+widget.title);

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('${widget.title}s')
          .doc(docId) // Assuming teacher ID is "teacher_1"
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> studentSnapshot) {
        if (studentSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!studentSnapshot.hasData ||
            studentSnapshot.data!.data() == null) {
          return Center(
            child: Text('No ${widget.title} data found.'),
          );
        }

        // Retrieve teacher's class and section
        Map<String, dynamic>? teacherData =
            studentSnapshot.data!.data() as Map<String, dynamic>?;

        mainClass = teacherData?['classs'];

        return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('NewSchool')
              .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
              .collection('attendence')
              .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
              .collection('noticeBoard')
              .doc(
                  "allNotice") // Assuming widget.studentId is the student's document ID
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> noticeSnapshot) {
            if (noticeSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!noticeSnapshot.hasData ||
                noticeSnapshot.data!.data() == null) {
              return const Center(
                child: Text('No notice yet.'),
              );
            }

            // Retrieve student leave requests
            Map<String, dynamic>? notice =
                noticeSnapshot.data!.data() as Map<String, dynamic>?;

            if (notice == null || !notice.containsKey('notice')) {
              return const Center(
                child: Text('No notice yet'),
              );
            }

            List<dynamic> allNotice = notice['notice'];

            List<dynamic> filteredNotice = allNotice
                .where((leave) =>
                    (leave['class'] == mainClass || leave['class'] == "All"))
                .toList();

            if (filteredNotice.isEmpty) {
              return const Center(
                child: Text('No notice found'),
              );
            }
            return ListView.builder(
              itemCount: filteredNotice.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> notice = filteredNotice[index];
                DateTime date = (notice['date'] as Timestamp).toDate();
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            notice['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.network(notice['imageSrc'])),
                        ),
                        const SizedBox(height: 10),
                        Text(notice['content']),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Class: ${notice['class']}'),
                            Text(
                                'Date: ${DateFormat('dd MMM yyyy').format(date)}')
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
      },
    );
  }
}
