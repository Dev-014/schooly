import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/modals/fetch_service/fetchService.pb.dart';
import 'package:practice/services/get_service%20/get_service.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';
import '../../../widgets/constant_text_widget.dart';


class ViewAnnouncement extends StatefulWidget {
  final bool isTeacher;
  const ViewAnnouncement({this.isTeacher = false,super.key});

  @override
  State<ViewAnnouncement> createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  var genericProvider;

  @override
  void initState() {
    super.initState();
    genericProvider = Provider.of<GenericProvider>(context, listen: false);


    _tabController = TabController(vsync: this, length: 5);
  }
  @override
  Widget build(BuildContext context) {
    return (widget.isTeacher)? FutureBuilder<FetchAnnouncementResponse>(
        future: GetService.getAnnouncement(token:genericProvider.sessionToken,context: context),
        builder: (BuildContext context, snapshot){
          return (!snapshot.hasData)?
          const Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*.9,
                      child: ListView.builder(


                        itemCount: snapshot.data!.announcements.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(snapshot.data![index]["title"]);
                          // print(snapshot.data![index]["time"]);
                          // print(snapshot.data![index]["category"]);
                          return announcementCard(title: snapshot.data!.announcements[index].title,time: snapshot.data!.announcements[index].timestamp.toString(),tag: snapshot.data!.announcements[index].category.name);
                        },

                      ),
                    )),
                // Center(child: Text("Tab 2 page")),
                // Center(child: Text("Tab 3 page")),
                // Center(child: Text("Tab 4 page")),
                // Center(child: Text("Tab 5 page")),

                //     ],
                //   ),
                // ),
              ],
            ),
          );
        }
    ):StudentWrapper(widget: FutureBuilder<FetchAnnouncementResponse>(
        future: GetService.getAnnouncement(token:genericProvider.sessionToken,context: context),
        builder: (BuildContext context, snapshot){
          return (!snapshot.hasData)?
          const Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Stack(
                //   children: [
                //     Container(
                //       height: 50,
                //       color: Colors.blue,
                //     ),
                //     Padding(
                //     padding: const EdgeInsets.only(left: 16.0,top: 22,),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Colors.grey,
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       padding: EdgeInsets.symmetric(vertical: 0),
                //       child: TabBar(
                //
                //         indicatorColor: Colors.black,
                //         indicatorSize: TabBarIndicatorSize.label,
                //         controller: _tabController,
                //         tabs: const [
                //           Tab(text: "Tab 1"),
                //           Tab(text: "Tab 2"),
                //           Tab(text: "Tab 3"),
                //           Tab(text: "Tab 4"),
                //           Tab(text: "Tab 5"),
                //
                //         ],
                //       ),
                //     ),
                //   )],
                // ),
                // Expanded(
                //   child: TabBarView(
                //
                //     controller: _tabController,
                //     children:  [
                Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*.9,
                      child: ListView.builder(


                        itemCount: snapshot.data!.announcements.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(snapshot.data![index]["title"]);
                          // print(snapshot.data![index]["time"]);
                          // print(snapshot.data![index]["category"]);
                          return announcementCard(title: snapshot.data!.announcements[index].title,time: snapshot.data!.announcements[index].timestamp.toString(),tag: snapshot.data!.announcements[index].category.name);
                        },

                      ),
                    )),
                // Center(child: Text("Tab 2 page")),
                // Center(child: Text("Tab 3 page")),
                // Center(child: Text("Tab 4 page")),
                // Center(child: Text("Tab 5 page")),

                //     ],
                //   ),
                // ),
              ],
            ),
          );
        }
    ), title: "Announcements");

  }

  Padding announcementCard({required String tag,required String time,required String title}) {
    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        // height: ,
                        // padding: EdgeInsets.all(),
                        child: Card(

                          clipBehavior: Clip.hardEdge,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Card(
                                    clipBehavior: Clip.hardEdge,

                                      color: Colors.blue,child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(tag,style: TextStyle(color: Colors.white,fontSize: 12))
                                  )),
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,size: 22,))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 12),
                              child: ConstantTextWidget.smallText(text: title,bold: true),
                            ),
                          Text(time,style: TextStyle(color: Colors.grey,fontSize: 11),)
                            ]
                  ),
                          ),
                        ),
                      ),
                    );
  }
}
