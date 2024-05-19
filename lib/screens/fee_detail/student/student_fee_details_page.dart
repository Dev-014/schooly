import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/services/other/fee_detail/fee_detail_services.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../widgets/fee_detail_card.dart';
import '../../multimedia_page.dart';

class FeeDetailsPage extends StatefulWidget {
  const FeeDetailsPage({super.key});

  @override
  State<FeeDetailsPage> createState() => _FeeDetailsPageState();
}

class _FeeDetailsPageState extends State<FeeDetailsPage> {
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StudentWrapper(
      title: "Fee Details",
        widget: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FutureBuilder(
              future: FeeDetailService.getFeeDetails(scholarID: genericProvider.loggedInStudent.scholarId),
              builder: (context, snapshot) {
                Map<String, Map<String, dynamic>>? mapOfMaps = snapshot.data;
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
                        var paymentDate = innerMap["payment date"] ?? "-";
                        var paymentAmount = innerMap["payment amount"] ?? "-";
                        var dueDate = innerMap["due date"] ?? "-";
                        var status = innerMap["status"] ?? "-";
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FeeDetailCard(
                            title: "title",
                            paymentDate: paymentDate,
                            paymentAmount: paymentAmount,
                            dueDate: dueDate,
                            status: status,
                          ),
                        );
                      } else {
                        return SizedBox(); // Handle missing inner map
                      }
                    }).toList(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
