import 'package:flutter/material.dart';

class PTWrapper extends StatefulWidget {
  final String title;
  final Widget tabBarView1;
  final Widget tabBarView2;
  final String firstTabTitle;
  const PTWrapper({required this.tabBarView1, required this.tabBarView2,required this.firstTabTitle,required this.title,super.key});

  @override
  State<PTWrapper> createState() => _PTWrapperState();
}

class _PTWrapperState extends State<PTWrapper> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xffe5e8ff).withOpacity(1),
        appBar: AppBar(
          toolbarHeight: 60,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              )),
          title:  Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 18),
              )),
          bottom:  TabBar(tabs: [
            Tab(text: "UPLOAD"+" "+widget.firstTabTitle,),
            Tab(text: "VIEW UPLOADED")
          ]),
          // backgroundColor: Colors.pink,
        ),
        body: TabBarView(children: [
          widget.tabBarView1,
          widget.tabBarView2,
        ]),
      ),
    );
  }
}
