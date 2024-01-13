import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/homework_card.dart';

class ReportCardPage extends StatefulWidget {
  const ReportCardPage({super.key});

  @override
  State<ReportCardPage> createState() => _ReportCardPageState();
}

class _ReportCardPageState extends State<ReportCardPage> {
  @override
  Widget build(BuildContext context) {
    var reportCards;
    String className;
    String report_card_link;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Report Card",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("unschool").doc('class').collection('10').doc('sectionC').collection("students").doc("studentID").snapshots(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData){
              print(snapshot.data!["report_cards"]);
              reportCards = snapshot.data!["report_cards"];
              for(MapEntry<String, dynamic> report in reportCards!.entries){
                className = report.key.toString();
                for(MapEntry<String,dynamic>rep in report.value.entries){
                  report_card_link = rep.value;
                  print(rep);

                }

              }
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
                        itemCount: 7,
                        itemBuilder: (context,index){
                          return  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: InkWell(
                                  onTap: (){},
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        Text("Class 10th (2014-15)",style: TextStyle(
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
          }),
    );
  }
}
