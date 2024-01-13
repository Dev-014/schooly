import 'package:flutter/material.dart';
import 'package:practice/common_widgets/examination_card.dart';
import 'package:practice/common_widgets/fee_detail_card.dart';

import '../common_widgets/multimedia_card.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({super.key});

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {

  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderPage()));
        }, icon: const Icon(Icons.arrow_back,size: 30,)),

        title: const Align(alignment:Alignment.centerLeft,child: Text("Examination",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(

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
                    child: const Text("Examination List",style: TextStyle(fontSize: 16,color: Colors.pink ),

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
      ),
    );
  }
}
