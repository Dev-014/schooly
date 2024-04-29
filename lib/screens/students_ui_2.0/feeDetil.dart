import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';
import '../../common_widgets/fee_detail_card.dart';

class FeeD extends StatefulWidget {
  const FeeD({super.key});

  @override
  State<FeeD> createState() => _FeeDState();
}

class _FeeDState extends State<FeeD> {
  var genericProvider;

  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }
  Future<Map<String, Map<String,dynamic>>?> func()async{
    var a =  await FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/fee_details').doc(genericProvider.loggedInStudent.scholarId).get();

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(

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
              children: snapshot.data!.keys.map((outerKey) {
                final innerMap = mapOfMaps![outerKey];
                if (innerMap != null) {
                  var paymentDate = innerMap["payment date"]??"-";
                  var paymentAmount = innerMap["payment amount"]??"-";
                  var dueDate = innerMap["due date"]??"-";
                  var status = innerMap["status"]?? "-";
                  return Column(
                    children: innerMap.keys.map((innerKey){
                      return  FeeDetailCard(title: "title", paymentDate: paymentDate, paymentAmount: paymentAmount, dueDate: dueDate, status: status,);

                    }).toList()
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
      ),
    );
  }
}
