import 'package:flutter/material.dart';
import 'package:practice/screens/students_ui_2.0/dashBoard2.dart';
import 'package:practice/screens/teachers/teacher_menu_page.dart';


import 'package:practice/screens/tempp.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";


// void fun()async{
//   try {
//     final snapshot = await FirebaseFirestore.instance.collection('unschool').get();
//     print(snapshot.docs[1].id);
//     Map<String, dynamic> document = snapshot.docs[1].data();
//     // document["school-noticeboard"];
//     // print(document);
//     // Handle the data retrieval here.
//   } catch (e) {
//     print('Error: $e');
//     // Handle the error, e.g., show an error message to the user.
//   }
// }


// void printFirestoreData() async {
//   try {
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('unschool')
//         .doc('class')
//         .collection('10')
//         .doc('sectionC')
//         .collection('students')
//         .doc('studentID')
//         .get();
//
//     if (documentSnapshot.exists) {
//       Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//       // print('Document ID: ${documentSnapshot.id}');
//       // print(documentSnapshot.data());
//       // print('Field 1: ${data['field1']}');
//       // print('Field 2: ${data['field2']}');
//       // Add more fields as needed
//     } else {
//       print('Document does not exist.');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }



class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}
var a;
class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    // printFirestoreData();
    // a = FirebaseFirestore.instance.collection('unschool').snapshots();
    // TODO: implement initState
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [

    DashBoard2(),
    Temp(),
    TeacherMenuPage(),
    // Your second page widget
    Container(), // Your third page widget
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xffe5e8ff),
        appBar: AppBar(
          elevation: 0,
          // toolbarHeight: 70,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          // ),
          leading:IconButton(onPressed: ()async{
          },icon:  const Icon(Icons.view_column,)),
          title: const Align(alignment:Alignment.center,
              child: Text("St Joseph school "),
          ),
          actions: const [
            Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.cancel_rounded),
          )],
          // backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(

            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
          BottomNavigationBarItem(icon: Column(
            children: [
              Icon(Icons.dashboard,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(AppLocalizations.of(context)!.dashboard),
              )
            ],
          ),label: "",),
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month,color: Colors.black,),label: AppLocalizations.of(context)!.attendance),
    BottomNavigationBarItem(icon: Icon(Icons.headphones,color: Colors.black,),label: "Support"),
    BottomNavigationBarItem(icon: Icon(Icons.logout,color: Colors.black,),label: "Logout")]),
        body: _pages.elementAt(_currentIndex)
    );
  }

}
