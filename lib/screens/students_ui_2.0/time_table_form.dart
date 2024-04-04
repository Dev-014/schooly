import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/teachers/upload_fee_details.dart';

import '../../bloc/firebase_storage.dart';
import '../../common_widgets/form_textfield.dart';
import '../teachers/time_table_new.dart';

class TimetableForm extends StatefulWidget {


  TimetableForm();

  @override
  _TimetableFormState createState() => _TimetableFormState();
}

class _TimetableFormState extends State<TimetableForm> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();
  String? section;
  String? clazz;
  String? subject;
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Timetable'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  formTextFields(hintText: "Class", iconData: Icons.group,textEditingController: _textController1 ),
                  // CustDropDown(
                  //   hintText: "Subject",
                  //     items: [
                  //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Science"))),
                  //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Social Science"))),
                  //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("Maths"))),
                  //       CustDropdownMenuItem(value: "value", child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text("English"))),
                  //     ],
                  //     onChanged: (){}),
                  formTextFields(
                      hintText: "Section", iconData: Icons.hotel_class_outlined,textEditingController: _textController2),
                  InkWell(
                    onTap: () async{

                       result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: [
                          'xlsx',
                        ],
                        withData: true, // Ensure you get the file read stream
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.attach_file_outlined),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Attach Study Material"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async{
                            // var a = await FirebaseFirestore.instance.collection('/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/fee_details').doc("859949").get();
                            // print(a.data());

                            // uploadFeeDataFromExcel();
                              uploadTimetableDataToFirestore(result: result!,section: _textController2.text,clazz: _textController1.text);

                          },
                          child: Text("Submit"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Adjust the value as needed
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}




// class LectureEntry {
//   String timeSlot = '';
//   String subject = '';
//   String teacher = '';
//   String room = '';
// }
//
// class TimetableForm extends StatefulWidget {
//   late final String day;
//   final Function(Map<String, dynamic>) onSubmit;
//
//   TimetableForm({required this.day, required this.onSubmit});
//
//   @override
//   _TimetableFormState createState() => _TimetableFormState();
// }
//
// class _TimetableFormState extends State<TimetableForm> {
//   final List<LectureEntry> lectures = [];
//   final TextEditingController lunchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Timetable - ${widget.day}'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButtonFormField(
//               value: widget.day,
//               items: [
//                 'Monday',
//                 'Tuesday',
//                 'Wednesday',
//                 'Thursday',
//                 'Friday',
//                 'Saturday',
//                 'Sunday',
//               ].map<DropdownMenuItem<String>>((day) {
//                 return DropdownMenuItem<String>(
//                   value: day,
//                   child: Text(day),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   widget.day = value!;
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Select Day'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Lectures:',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             for (var i = 0; i < lectures.length; i++)
//               LectureInput(
//                 lecture: lectures[i],
//                 onChanged: (value) {
//                   lectures[i] = value;
//                 },
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   lectures.add(LectureEntry());
//                 });
//               },
//               child: Text('Add Lecture'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: lunchController,
//               decoration: InputDecoration(labelText: 'Lunch Break'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Collect data and call the onSubmit function
//                 Map<String, dynamic> data = {
//                   'day': widget.day,
//                   // 'lectures': lectures.map((e) => e.toJson()).toList(),
//                   'lunch': lunchController.text,
//                 };
//                 widget.onSubmit(data);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LectureInput extends StatelessWidget {
//   final LectureEntry lecture;
//   final Function(LectureEntry) onChanged;
//
//   LectureInput({required this.lecture, required this.onChanged});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) {
//             lecture.timeSlot = value;
//             onChanged(lecture);
//           },
//           decoration: InputDecoration(labelText: 'Time Slot'),
//         ),
//         TextField(
//           onChanged: (value) {
//             lecture.subject = value;
//             onChanged(lecture);
//           },
//           decoration: InputDecoration(labelText: 'Subject'),
//         ),
//         TextField(
//           onChanged: (value) {
//             lecture.teacher = value;
//             onChanged(lecture);
//           },
//           decoration: InputDecoration(labelText: 'Teacher'),
//         ),
//         TextField(
//           onChanged: (value) {
//             lecture.room = value;
//             onChanged(lecture);
//           },
//           decoration: InputDecoration(labelText: 'Room'),
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }





// import 'package:flutter/material.dart';
//
// class TimetableForm extends StatefulWidget {
//   final List<String> daysOfWeek;
//   final Function(Map<String, dynamic>) onSubmit;
//
//   TimetableForm({required this.daysOfWeek, required this.onSubmit});
//
//   @override
//   _TimetableFormState createState() => _TimetableFormState();
// }
//
// class _TimetableFormState extends State<TimetableForm> {
//   String selectedDay = '';
//
//   TimeOfDay? selectedStartTime;
//   TimeOfDay? selectedEndTime;
//
//   final TextEditingController subjectController = TextEditingController();
//   final TextEditingController teacherController = TextEditingController();
//   final TextEditingController roomController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Timetable'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButtonFormField<String>(
//               value: selectedDay.isNotEmpty ? selectedDay : null,
//               hint: Text('Select Day'),
//               items: widget.daysOfWeek.map((day) {
//                 return DropdownMenuItem<String>(
//                   value: day,
//                   child: Text(day),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedDay = value!;
//                 });
//               },
//             ),
//             ElevatedButton(
//               onPressed: () => _selectTime(context, true),
//               child: Text(selectedStartTime != null
//                   ? 'Start Time: ${selectedStartTime!.format(context)}'
//                   : 'Select Start Time'),
//             ),
//             ElevatedButton(
//               onPressed: () => _selectTime(context, false),
//               child: Text(selectedEndTime != null
//                   ? 'End Time: ${selectedEndTime!.format(context)}'
//                   : 'Select End Time'),
//             ),
//             TextField(
//               controller: subjectController,
//               decoration: InputDecoration(labelText: 'Subject'),
//             ),
//             TextField(
//               controller: teacherController,
//               decoration: InputDecoration(labelText: 'Teacher'),
//             ),
//             TextField(
//               controller: roomController,
//               decoration: InputDecoration(labelText: 'Room'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Collect data and call the onSubmit function
//                 Map<String, dynamic> data = {
//                   'day': selectedDay,
//                   'startTime': selectedStartTime?.format(context),
//                   'endTime': selectedEndTime?.format(context),
//                   'subject': subjectController.text,
//                   'teacher': teacherController.text,
//                   'room': roomController.text,
//                 };
//                 widget.onSubmit(data);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickedTime != null) {
//       setState(() {
//         if (isStartTime) {
//           selectedStartTime = pickedTime;
//         } else {
//           selectedEndTime = pickedTime;
//         }
//       });
//     }
//   }
// }
//
// class TimetableUploadScreen extends StatefulWidget {
//   @override
//   _TimetableUploadScreenState createState() => _TimetableUploadScreenState();
// }
//
// class _TimetableUploadScreenState extends State<TimetableUploadScreen> {
//   List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TimetableForm(
//         daysOfWeek: daysOfWeek,
//         onSubmit: (Map<String, dynamic> data) {
//           // Process the submitted data (e.g., upload to Firestore)
//           print('Data for ${data['day']} submitted: $data');
//           // You can navigate to the next screen here if needed
//         },
//       ),
//     );
//   }
// }
//
//
