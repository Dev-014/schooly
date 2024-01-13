import 'package:flutter/material.dart';
import 'package:practice/common_widgets/fee_detail_card.dart';

import 'multimedia_page.dart';

class FeeDetailsPage extends StatefulWidget {
  const FeeDetailsPage({super.key});

  @override
  State<FeeDetailsPage> createState() => _FeeDetailsPageState();
}

class _FeeDetailsPageState extends State<FeeDetailsPage> {

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
        title: const Align(alignment:Alignment.centerLeft,child: Text("Fee Details",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for(int i =0; i<5;i++)
                  GestureDetector(
                    onTap: (){
                      _selectedItem =i;

                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,bottom:12,right: 12.0,left: 16),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration:  BoxDecoration(
// borderRadius: BorderRadius.circular(.10),
                          border: (_selectedItem==i)?const Border(

                              bottom: BorderSide(color: Colors.pink, width: 3.0,),
                              top:BorderSide.none, left: BorderSide.none, right: BorderSide.none):Border()
                        ),
                        child: const Text("School Fee",style: TextStyle(fontSize: 16,color: Colors.pink ),

                      ),
                    )
                    ),
                  ),
                ],
              ),
            ),
            for(int i=0;i<10;i++)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
              child: FeeDetailCard(title: "title", date: "date"),
            )
          ],
        ),
      ),
    );
  }
}
