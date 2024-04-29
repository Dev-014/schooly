import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common_methods/time_table_new.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
// Function to fetch timetable entries for a specific day
  Future<Map<String, dynamic>?> fetchTimetableForDay(
      String studentClass, String studentSection) async {
    try {
      // Make a query to fetch the timetable based on class and section
      DocumentSnapshot timetableSnapshot = await FirebaseFirestore.instance
          .collection(
              '/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/time_table')
          .where('class', isEqualTo: studentClass)
          .where('section', isEqualTo: studentSection)
          .get()
          .then((querySnapshot) => querySnapshot.docs.first);

      if (timetableSnapshot.exists) {
        // Access timetableEntries map
        Map<String, dynamic> timetableEntries =
            timetableSnapshot.data() as Map<String, dynamic>;

        // Access timetable entries for the specified day
        Map<String, dynamic>? dayTimetable =
            timetableEntries["time_table_entries"];
        if (dayTimetable != null) {
          // Process and display timetable entries for the day
          // print(dayTimetable);
          return dayTimetable;
        } else {
          print('Timetable entries not found.');
          return null;
        }
      } else {
        // Timetable not found for the student's class and section
        print('Timetable not found.');
      }
    } catch (e) {
      print('Error fetching timetable: $e');
    }
  }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   fetchTimetableForDay("5", "B");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text("TImeTable "),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                tabs: [
                  // Tab(
                  //   text: "Sun",
                  //   iconMargin: EdgeInsets.only(left: 4),
                  // ),
                  Tab(text: "Mon"),
                  Tab(
                    text: ("Tue"),
                  ),
                  Tab(
                    text: ("Wed"),
                  ),
                  Tab(
                    text: ("Thu"),
                  ),
                  Tab(
                    text: ("Fri"),
                  ),
                  Tab(
                    text: ("Sat"),
                  ),
                ]),
          ),
        ),
        body: FutureBuilder(
            future: fetchTimetableForDay("5", "B"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}snapshot.error}'));
              } else {
                var timetableData = snapshot.data as Map<String, dynamic>?;
                // print("<<<<<object>>>>>");
                // print(timetableData);
                var mondayLectures = timetableData?['Monday'] ?? [];
                print(mondayLectures);
                var tuesdayLectures = timetableData?['Tuesday'] ?? [];
                var wednesdayLectures = timetableData?['Wednesday'] ?? [];
                var thursdayLectures = timetableData?['Thursday'] ?? [];
                var fridayLectures = timetableData?['Friday'] ?? [];
                var saturdayLectures = timetableData?['Saturday'] ?? [];


                return TabBarView(children: [
               lecturesList(listOflectures: mondayLectures),
                  lecturesList(listOflectures: tuesdayLectures),
lecturesList(listOflectures: wednesdayLectures),
                  lecturesList(listOflectures: thursdayLectures),
                  lecturesList(listOflectures: fridayLectures),
                lecturesList(listOflectures: saturdayLectures),

                  // Icon(Icons.account_balance_sharp),
                  // InkWell(onTap: (){
                  //   uploadTimetableDataToFirestore();
                  //
                  // }
                  // ,child: Icon(Icons.baby_changing_station)),

                  // Icon(Icons.ac_unit),
                ]);
              }
            }),
      ),
    );
  }
}

Widget lecturesList({required List<dynamic> listOflectures}){
  return ListView.builder(
    itemCount: listOflectures.length,
    itemBuilder: (context, index) {
      var lecture = listOflectures[index];



      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Card(

                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: Colors.blue,
                    child: Center(child: Text(lecture['subject'].toString().substring(0,3).toUpperCase(),style: TextStyle(color: Colors.white),)),

                  ),

                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lecture['subject'],style: TextStyle(fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.watch_later_outlined,size: 15,),
                        ),
                        Text(
                            '${lecture['timeSlot']}'),
                        Text(" with ${lecture['teacher']}")



                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1,color: Colors.grey,height: 1,)

            ],
          ),
          Divider(thickness: 1,color: Colors.grey,height: 1,),
        ],
      );
    },
  );

}