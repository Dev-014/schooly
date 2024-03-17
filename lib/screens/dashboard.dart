import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/homework_card.dart';
import 'package:practice/common_widgets/notice_board.dart';
import 'package:practice/screens/homework_page.dart';
import 'package:practice/screens/notice_board_page.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:rxdart/rxdart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var a;
  var listofNotice;
  dynamic getValueFromDocumentSnapshot(String key, DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      if (data!.containsKey(key)) {
        return data[key];
      }
    }
    return null; // Key not found or document doesn't exist
  }
  dynamic getValueFromListOfMap(String key, Map<String, dynamic> data) {

      if (data!.containsKey(key)) {
        return data[key];
      }

    return null; // Key not found or document doesn't exist
  }
  @override
  Widget build(BuildContext context) {

    final collectionStream1 = FirebaseFirestore.instance.
    collection("unschool").doc('class').collection('10').doc('sectionC').snapshots();


    final Stream<DocumentSnapshot<Map<String, dynamic>>> collectionStream2 = FirebaseFirestore.instance.
    collection("unschool").doc('class').collection("10").doc("notice-board").snapshots();


// print(combinedStream);
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading:IconButton(
          onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.menu_outlined,size: 30,),),
        title: const Align(alignment:Alignment.centerLeft,child: Column(
          children: [
            Text("Yogita"),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text("Class VII A",style: TextStyle(fontSize: 12, fontWeight:FontWeight.w200,
                  // color: Color.fromRGBO(1, 1, 1, .5),
              ),),
            )
          ],

        )),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.access_time_sharp),
        )],
        // backgroundColor: Colors.pink,


      ),
      body:  StreamBuilder(
        stream:  CombineLatestStream.combine2(collectionStream1, collectionStream2, (s1, s2) => [s1, s2]),
        builder: (BuildContext context, snapshot){


          if (snapshot.hasData) {
    ///It is used to calculate length of list of homework later on
             a  = getValueFromDocumentSnapshot("Homework",snapshot.data![0]);
             listofNotice = getValueFromListOfMap("notice-board", snapshot.data![1]["section-c"]);


          }else
            if (snapshot.hasError) {
            // Handle error
             print("error");
          }
        return  (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
          child: SizedBox(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const NoticeBoardPage()));
                },child: const Align(alignment: Alignment.centerLeft,child: Text("Notice Board",style: TextStyle(fontSize: 16,
                  // color: Colors.pink,
                ),))),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  width: 400,
                  height: 150,
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listofNotice.length,
                    itemBuilder: (context, index) {
                      List<DocumentSnapshot<Map<String, dynamic>>>? listOfMap = snapshot.data;
                      Map<String, dynamic> map = listOfMap![1].data()!;
                      final noticeBoard = map["section-c"]["notice-board"];
                      // print(no)
                      String content = noticeBoard[index]["content"];
                      String author = noticeBoard[index]["author"];
                      return  Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: NoticeBoard(notice: content, date: "20 June 2020"),
                      );
                    },
                  ),
                )),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeWorkPage()));
                },child: const Align(alignment: Alignment.centerLeft,child: Text("Home Work",style: TextStyle(fontSize: 16,
                    // color: Colors.pink,
                ),))),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        width: 400,
                        height: 400,
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: ListView.builder(

                          scrollDirection: Axis.vertical,
                          itemCount:a.length??1,
                          itemBuilder: (context, index) {
                            List<DocumentSnapshot<Map<String, dynamic>>>? listOfMap = snapshot.data;
                            Map<String, dynamic> map = listOfMap![0].data()!;
                            final listOfHomeworks = map["Homework"];
                            ///In database Homework is a list of homework

                            String homework_heading = listOfHomeworks[index]["homework"];
                            bool status = listOfHomeworks[index]["status"];


                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: HomeWorkCard(date: "English / Today",title:homework_heading,status:status),
                            );
                          },
                        ),
                      )),
                ),

            ],),
          ),
        );}
      ),
    );
  }
}
