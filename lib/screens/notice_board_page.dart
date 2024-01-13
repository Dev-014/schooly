import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/homework_card.dart';
import 'package:practice/common_widgets/notice_board.dart';
import 'package:practice/screens/homework_page.dart';

class NoticeBoardPage extends StatefulWidget {
  const NoticeBoardPage({super.key});

  @override
  State<NoticeBoardPage> createState() => _NoticeBoardPageState();
}

class _NoticeBoardPageState extends State<NoticeBoardPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading:IconButton(onPressed:(){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back,size: 30,),),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Notice Board")),
        backgroundColor: Colors.pink,


      ),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("unschool").doc('class').collection("10").doc("notice-board").snapshots(),
        builder: (BuildContext context,snapshot) {
          String? title;
        if(snapshot.hasData){
          final notice_board =snapshot!.data?["section-c"];
           title = notice_board["title"];
        }

          return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              // width: 400,
              height: MediaQuery.of(context).size.height*.9,
              // constraints: const BoxConstraints(maxWidth: 400),
              child:SingleChildScrollView(
                child: Wrap(
                    spacing: 20.0, // Minimal gap between items.
                    runSpacing: 20.0, // Minimal gap between rows.
                    children:[
                      for(int i =0;i<10;i++)
                         NoticeBoard(notice: title!, date: "20 June 2020",height: 180,width: 170,)]



                ),
              ));
        },

      ),
    );
  }
}
