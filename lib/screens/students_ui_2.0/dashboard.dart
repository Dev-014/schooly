import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/screens/students_ui_2.0/dashBoard2.dart';
import 'package:practice/screens/teachers/teacher_attendance.dart';
import 'package:practice/screens/teachers/teacher_menu_page.dart';

import 'package:provider/provider.dart';
import 'package:practice/bloc/generic_bloc.dart';

import 'package:practice/screens/tempp.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

var a;

class _MenuPageState extends State<MenuPage> {
  var genericProvider;

  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context, listen: false);

    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _teacherPages = [
    DashBoard2(),
    Temp(),
    Container(),
    // Your second page widget
    Container(), // Your third page widget
  ];
  final List<Widget> _pages = [
    DashBoard2(),
    Container(),
    // Your second page widget
    Container(), // Your third page widget
  ];
  final List<Widget> _principalPages = [
    DashBoard2(),
    TeachersAttendance(),
    Container(),
    // Your second page widget
    Container(), // Your third page widget
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe5e8ff),
        appBar: AppBar(
          elevation: 0,
          // toolbarHeight: 70,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          // ),
          leading: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.view_column,
              )),
          title: Text("St Joseph school "),

        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(AppLocalizations.of(context)!.dashboard),
                    )
                  ],
                ),
                label: "",
              ),
              if (genericProvider.userProfile == UserProfile.teacher ||
                  genericProvider.userProfile == UserProfile.principal)
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    label: AppLocalizations.of(context)!.attendance),

              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.headphones,
                    color: Colors.black,
                  ),
                  label: "Support"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  label: "Logout")
            ]),
        body: (genericProvider.userProfile == UserProfile.principal)?_principalPages.elementAt(_currentIndex):(genericProvider.userProfile == UserProfile.teacher)?_teacherPages.elementAt(_currentIndex):_pages.elementAt(_currentIndex));
  }
}
