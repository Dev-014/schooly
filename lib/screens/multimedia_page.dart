import 'package:flutter/material.dart';
import 'package:practice/common_widgets/fee_detail_card.dart';
import 'package:practice/screens/examination_page.dart';
import 'package:practice/utils/constants_colors.dart';

import '../common_widgets/multimedia_card.dart';

class MultiMediaPage extends StatefulWidget {
  final List<Map<String, dynamic>?>? listOfStudyMaterial;
  const MultiMediaPage({this.listOfStudyMaterial,super.key});

  @override
  State<MultiMediaPage> createState() => _MultiMediaPageState();
}

class _MultiMediaPageState extends State<MultiMediaPage> {

  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderPage()));
        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        actions: [Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        )],
        title: const Align(alignment:Alignment.centerLeft,child: Text("Multimedia",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
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
                            child: const Text("Videos",style: TextStyle(fontSize: 16,
                                // color: Colors.pink
                            ),

                            ),
                          )
                      ),
                    ),
                ],
              ),
            ),
            for(int i=0; i<widget.listOfStudyMaterial!.length;i++)
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                child: MultiMediaCard(title: widget.listOfStudyMaterial?[i]?["title"] ?? "Got Null", date: "date"),
              )
          ],
        ),
      ),
    );
  }
}
