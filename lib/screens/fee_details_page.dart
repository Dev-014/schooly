import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/common_widgets/fee_detail_card.dart';
import 'package:practice/utils/constants_colors.dart';

import 'multimedia_page.dart';

class FeeDetailsPage extends StatefulWidget {
  const FeeDetailsPage({super.key});

  @override
  State<FeeDetailsPage> createState() => _FeeDetailsPageState();
}

class _FeeDetailsPageState extends State<FeeDetailsPage> {
  Future<Map<String, Map<String,dynamic>>?> func()async{
    var a =  await FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/fee_details').doc("859949").get();

    Map<String, Map<String, dynamic>> convertedMap = {};

    a.data()!.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        convertedMap[key] = value;
      }
    });

    print("MMMMMM");
    print(a.data());

    return convertedMap as Map<String, Map<String,dynamic>>?;
  }
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
        title: const Align(alignment:Alignment.centerLeft,child: Text("Fee Details",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,
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

                              bottom: BorderSide(color: Colors.blue, width: 3.0,),
                              top:BorderSide.none, left: BorderSide.none, right: BorderSide.none):Border()
                        ),
                        child: const Text("School Fee",style: TextStyle(fontSize: 16,
                            // color: Colors.pink,
                        ),

                      ),
                    )
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(

              future: func(),
              builder: (context,snapshot){
                Map<String, Map<String,dynamic>>? mapOfMaps = snapshot.data;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  print(snapshot.data);
                }

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: mapOfMaps!.keys.map((outerKey) {
                      final innerMap = mapOfMaps[outerKey];
                      if (innerMap != null) {
                        print(innerMap);
                        var paymentDate = innerMap["payment date"]??"-";
                        var paymentAmount = innerMap["payment amount"]??"-";
                        var dueDate = innerMap["due date"]??"-";
                        var status = innerMap["status"]?? "-";
                        return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FeeDetailCard(title: "title", paymentDate: paymentDate, paymentAmount: paymentAmount, dueDate: dueDate, status: status,),
                              );



                        //   Column(
                        //   children: innerMap.keys.map((innerKey) {
                        //     final value = innerMap[innerKey];
                        //     return ListTile(
                        //       title: SelectionArea(child: Text('$outerKey - $innerKey: $value')),
                        //     );
                        //   }).toList(),
                        // );
                      } else {
                        return SizedBox(); // Handle missing inner map
                      }
                    }).toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
