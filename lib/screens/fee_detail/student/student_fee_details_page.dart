import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pbserver.dart';
import 'package:practice/services/get_service%20/get_service.dart';
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
            child: FutureBuilder<FetchFeeDetailsResponse>(
              future: GetService.getFeeDetails(token: genericProvider.sessionToken, context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData)
                  print("?????");
                  FetchFeeDetailsResponse? res = snapshot.data ;


                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: res!.details.length,
                      itemBuilder: (BuildContext context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                      child: FeeDetailCard(
                        title: "title",
                        paymentDate: res.details[index].paymentDate,
                        paymentAmount: res!.details[index].amount,
                        dueDate: res!.details[index].dueDate,
                        status: res!.details[index].paymentStatus,
                      ),
                    );
                  }),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
