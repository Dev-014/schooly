import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../widgets/multimedia_card.dart';

class MultiMediaPage extends StatefulWidget {
  final List<StudyMaterial>? listOfStudyMaterial;
  const MultiMediaPage({this.listOfStudyMaterial, super.key});

  @override
  State<MultiMediaPage> createState() => _MultiMediaPageState();
}

class _MultiMediaPageState extends State<MultiMediaPage> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return StudentWrapper(widget: SingleChildScrollView(
      padding: EdgeInsets.only(top: 16),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       for (int i = 0; i < 5; i++)
          //         GestureDetector(
          //           onTap: () {
          //             _selectedItem = i;
          //             setState(() {});
          //           },
          //           child: Padding(
          //               padding: const EdgeInsets.only(
          //                   top: 20, bottom: 12, right: 12.0, left: 16),
          //               child: Container(
          //                 padding: const EdgeInsets.all(3),
          //                 decoration: BoxDecoration(
          //                     border: (_selectedItem == i)
          //                         ? const Border(
          //                             bottom: BorderSide(
          //                               color: Colors.pink,
          //                               width: 3.0,
          //                             ),
          //                             top: BorderSide.none,
          //                             left: BorderSide.none,
          //                             right: BorderSide.none)
          //                         : Border()),
          //                 child: const Text(
          //                   "Videos",
          //                   style: TextStyle(
          //                     fontSize: 16,
          //                   ),
          //                 ),
          //               )),
          //         ),
          //     ],
          //   ),
          // ),
          for (int i = 0; i < widget.listOfStudyMaterial!.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: MultiMediaCard(
                  title:
                  widget.listOfStudyMaterial?[i].title ?? "Got Null",
                  date:  widget.listOfStudyMaterial?[i].subjectId ?? "Got Null" ),
            )
        ],
      ),
    ), title: "MultiMedia");
  }
}
