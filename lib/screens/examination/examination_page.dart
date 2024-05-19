import 'package:flutter/material.dart';

import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../../widgets/examination_card.dart';


class ExaminationPage extends StatefulWidget {
  const ExaminationPage({super.key});

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {

  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return StudentWrapper(widget: SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom:12,right: 12.0,left: 16),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  child: const Text("Examination List",style: TextStyle(fontSize: 16,
                    // color: Colors.pink,
                  ),

                  ),
                )
            ),
          ),
          for(int i=0;i<10;i++)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
              child: ExaminationCard(title: "title", date: "date"),
            )
        ],
      ),
    ), title: "Examination");
  }
}
