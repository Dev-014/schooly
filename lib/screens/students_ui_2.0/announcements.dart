import 'package:flutter/material.dart';
import 'package:practice/common_widgets/ui_2.0/constant_text_widget.dart';
import 'package:practice/utils/constants_colors.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: ConstantColors.primary_color,
        title: Text("Announcement"),
        // bottom: TabBar(
        //   indicatorColor: Colors.grey,
        //   splashBorderRadius: BorderRadius.all(Radius.circular(12)),
        //   controller: _tabController,
        //   tabs: [
        //     Tab(icon: Icon(Icons.home), text: "Home"),
        //     Tab(icon: Icon(Icons.settings), text: "Settings"),
        //   ],
        // ),
      ),
        body: Column(
          children: [

            Stack(
              children: [
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
                Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 22,),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: TabBar(

                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    tabs: const [
                      Tab(text: "Tab 1"),
                      Tab(text: "Tab 2"),
                      Tab(text: "Tab 3"),
                      Tab(text: "Tab 4"),
                      Tab(text: "Tab 5"),

                    ],
                  ),
                ),
              )],
            ),
            Expanded(
              child: TabBarView(

                controller: _tabController,
                children:  [
                  Center(
                      child: ListView.builder(


                        itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return announcementCard();
                          },

                      )),
                  Center(child: Text("Tab 2 page")),
                  Center(child: Text("Tab 3 page")),
                  Center(child: Text("Tab 4 page")),
                  Center(child: Text("Tab 5 page")),

                ],
              ),
            ),
          ],
        )

    );

  }

  Padding announcementCard() {
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
                                    child: Text("EXAMS",style: TextStyle(color: Colors.white,fontSize: 12))
                                  )),
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.accessibility_outlined,size: 22,))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 12),
                              child: ConstantTextWidget.smallText(text: "Update on exams - Postponed to next week due lockdown news",bold: true),
                            ),
                          Text("10:30 AM",style: TextStyle(color: Colors.grey,fontSize: 11),)
                            ]
                  ),
                          ),
                        ),
                      ),
                    );
  }
}
