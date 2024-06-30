import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:practice/widgets/report_card_viewer.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

class ReportCardPage extends StatefulWidget {
  const ReportCardPage({super.key});

  @override
  State<ReportCardPage> createState() => _ReportCardPageState();
}

class _ReportCardPageState extends State<ReportCardPage> {


  Future<List<Map<String, dynamic>>> getReportCard({required String scholarID}) async {
    List<Map<String, dynamic>> reportCardList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/students/$scholarID/report_cards')
        .get();

    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> announcementItem = {
        'report_card_id': doc.id,
        'report_card_url': doc['report_card_url'],
        'scholar_id': doc['scholar_id'],
      };
      reportCardList.add(announcementItem);
    });
    print("object");
    print(reportCardList);
    return reportCardList;
  }
  var scholarId;
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    scholarId = genericProvider.scholarId;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var reportCards;
    String className;
    String report_card_link;
    return StudentWrapper(widget:  FutureBuilder<FetchReportCardResponse>(
        future: GetService.getReportCard(token: genericProvider.sessionToken, context: context,),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){

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
                      itemCount: snapshot.data?.reportCards.length ?? 0,
                      itemBuilder: (context,index){
                        return  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: InkWell(
                                onTap: (){
                                  // final fileUrl = snapshot.data![index]["report_card_url"];
                                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                                  //   return ReportCardViewer(fileUrl: fileUrl,);
                                  // }));
                                },
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      Text(snapshot.data?.reportCards[index].grade.toString() ?? "",style: TextStyle(
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
        }),title: "Report Card",);
  }
}
