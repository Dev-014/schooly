import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/widgets/student_wrapper.dart';

import '../../../widgets/constant_text_widget.dart';


class ViewAnnouncement extends StatefulWidget {
  const ViewAnnouncement({super.key});

  @override
  State<ViewAnnouncement> createState() => _ViewAnnouncementState();
}

class _ViewAnnouncementState extends State<ViewAnnouncement> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Future<List<Map<String, dynamic>>> getAnnouncement() async {
    List<Map<String, dynamic>> announcementList = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/announcements/announcement_index1/all')
        .get();

    querySnapshot.docs.forEach((doc) {
      print("MMMMMMMMM");
      print(doc);
      Map<String, dynamic> announcementItem = {
        'id': doc.id,
        'description': doc['description'],
        'title': doc['title'],
        'time': doc['time'],
        'category': doc['category']
      };
      announcementList.add(announcementItem);
    });
    print("object");
    print(announcementList);
    return announcementList;
  }
  @override
  void initState() {
    super.initState();
    getAnnouncement();
    _tabController = TabController(vsync: this, length: 5);
  }
  @override
  Widget build(BuildContext context) {
    return  StudentWrapper(widget: FutureBuilder(
        future: getAnnouncement(),
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


                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(snapshot.data![index]["title"]);
                          print(snapshot.data![index]["time"]);
                          print(snapshot.data![index]["category"]);
                          return announcementCard(title: snapshot.data![index]["title"],time: snapshot.data![index]["time"],tag: snapshot.data![index]["category"]);
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
