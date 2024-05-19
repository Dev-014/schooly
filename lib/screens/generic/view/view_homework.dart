import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../services/other/homework/homework_service.dart';
import '../../../widgets/homework_card.dart';

class ViewHomework extends StatefulWidget {
  const ViewHomework({super.key});

  @override
  State<ViewHomework> createState() => _ViewHomeworkState();
}

class _ViewHomeworkState extends State<ViewHomework> {

  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: HomeWorkService.getHomeworkListForClassAndSection(empID: genericProvider.empID),
        builder: (BuildContext context, snapshot) {
          return (!snapshot.hasData)?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: Column(

                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                    child: Align(alignment: Alignment.centerLeft,
                        child: Text("Today",
                          style: TextStyle(fontSize: 20,
                          ),)),
                  ),
                  Container(
                    height: 550,
                    width: 400,
                    child: ListView.builder(
                        shrinkWrap: true,

                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final listOfMap = snapshot.data;

                          Map<String, dynamic> map = listOfMap![index];
                          final homework_heading = map["title"];
                          final status = map["status"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10),
                            child: HomeWorkCard(title: homework_heading,status:status, date: map["subject"],),
                          );
                        }),
                  ),
                ]
            ),
          );
        });
  }
}
