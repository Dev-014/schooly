import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({Key? key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  late DateTime _selectedDate;
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  var genericProvider;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

  }


  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controller.text = DateFormat('dd MMM yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            "Instructions",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          "1. Same day leave can be applied before 7:00 AM",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          "2. Only Parent can apply for leave on behalf of their child.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            applyLeaveTextField(
              hintText: "dd MMM yyyy",
              headingText: "From Date",
              controller: _fromDateController,
              onTap: () => _selectDate(context, _fromDateController),
            ),
            applyLeaveTextField(
              hintText: "dd MMM yyyy",
              headingText: "To Date",
              controller: _toDateController,
              onTap: () => _selectDate(context, _toDateController),
            ),
            applyLeaveTextField(
              suffix: false,
              hintText: "Enter comment here",
              headingText: "Reason",
              controller: _reasonController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: SizedBox(
                height: 35,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _applyLeave(context),
                  child: const Text(
                    "APPLY",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff11489c),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding applyLeaveTextField({
    required String hintText,
    required String headingText,
    bool suffix = true,
    TextEditingController? controller,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Text(
              headingText,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: TextField(
              controller: controller,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: suffix
                    ? IconButton(
                    onPressed: onTap, icon: const Icon(Icons.calendar_today))
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _applyLeave(BuildContext context) async {
    // Extract values entered by the user
    String reason = _reasonController.text.trim();
    String fromDate = _fromDateController.text.trim();
    String toDate = _toDateController.text.trim();

    // Check if any of the fields are empty
    if (reason.isEmpty || fromDate.isEmpty || toDate.isEmpty) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill in all fields'),
      ));
      return; // Exit the method early if any field is empty
    }

    // Get the current timestamp for the appliedDate field
    Timestamp appliedDate = Timestamp.now();

    try {
      // Generate the leave ID
      String leaveId = await _generateLeaveId();

      // Construct the data to be saved to Firestore
      Map<String, dynamic> leaveData = {
        'id': leaveId,
        'fromDate': fromDate,
        'toDate': toDate,
        'appliedDate': appliedDate,
        'teacherApproval': 'Pending',
        'principalApproval': 'Pending',
        'stuId': genericProvider.scholarId, // Assuming '1' is the student ID
        'reason': reason,
      };

      // Add the leave application data to Firestore
      await FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('leave_application')
          .doc(
          "student") // Assuming widget.studentId is the student's document ID
          .update({
        'studentLeave': FieldValue.arrayUnion([leaveData])
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Leave application submitted successfully'),
      ));
    } catch (error) {
      print('Error submitting leave application: $error');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
        Text('Failed to submit leave application. Please try again later.'),
      ));
    }
  }

  Future<String> _generateLeaveId() async {
    // Query Firestore to get the studentLeave document
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await FirebaseFirestore.instance
        .collection('NewSchool')
        .doc("G0ITybqOBfCa9vownMXU")
        .collection('attendence')
        .doc('y2Yes9Dv5shcWQl9N9r2')
        .collection('leave_application')
        .doc('student')
        .get();

    // Get the studentLeave data
    Map<String, dynamic> leaveData = documentSnapshot.data() ?? {};

    // Extract the list of leave applications
    List<dynamic> leaveApplications = leaveData['studentLeave'] ?? [];

    // If there are no existing leave applications, return 1 as the initial leave ID
    if (leaveApplications.isEmpty) {
      return '1';
    }

    // Find the maximum leave ID among the existing leave applications
    int maxLeaveId = 0;
    for (var leave in leaveApplications) {
      int? leaveId = int.tryParse(leave['id'] ?? '');
      if (leaveId != null && leaveId > maxLeaveId) {
        maxLeaveId = leaveId;
      }
    }

    // Calculate the next leave ID by adding 1 to the maximum leave ID
    int nextLeaveId = maxLeaveId + 1;

    // Return the next leave ID as a string
    return nextLeaveId.toString();
  }


}



// import 'package:flutter/material.dart';
// import 'package:practice/utils/constants_colors.dart';
//
// class ApplyLeavePage extends StatefulWidget {
//   const ApplyLeavePage({super.key});
//
//   @override
//   State<ApplyLeavePage> createState() => _ApplyLeavePageState();
// }
//
// class _ApplyLeavePageState extends State<ApplyLeavePage> {
//   @override
//   Widget build(BuildContext context) {
//     late DateTime _selectedDate;
//
//     @override
//     void initState() {
//       super.initState();
//       _selectedDate = DateTime.now();
//     }
//
//     Future<void> _selectDate(BuildContext context) async {
//       final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: _selectedDate,
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2101),
//       );
//
//       if (picked != null && picked != _selectedDate) {
//         setState(() {
//           _selectedDate = picked;
//         });
//       }
//     }
//
//
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Card(
//               elevation: 0,
// color: Colors.white,
//               // color: ConstantColors.backGroundColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2.0),
//                           child: Text("Instructions",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 16),),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       child: Text("1. Same day leave can be applied before 7:00 AM",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 2.0),
//                       child: Text("2. Only Parent can apply for leave on  behalf of their child.",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 4.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 0.0),
//                   child: Text("From Date", style: TextStyle(
//                       color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 0),
//                   child: TextField(
//                     decoration: InputDecoration(
//
//                       hintText:"dd MMM YYYY",
//
//                       suffixIcon:  IconButton(onPressed: (){_selectDate(context);},icon: Icon(Icons.calendar_month,color: Colors.black87)),
//
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // applyLeaveTextField(hintText: "dd MMM YYYY", headingText: "From Date"),
//           applyLeaveTextField(hintText: "dd MMM YYYY", headingText: "To Date"),
//           applyLeaveTextField(suffix: false, hintText: "Enter comment here", headingText: "Reason"),
//
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 32.0),
//             child: SizedBox(
//               height: 35,
//                 width: double.infinity,
//                 child: ElevatedButton(onPressed: (){}, child: Text("APPLY",style: TextStyle(fontSize: 16,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xff11489c),),)),
//           )
//
//
//         ],
//       ),
//     );
//   }
//
//   Padding applyLeaveTextField({required String hintText, required String headingText, bool suffix=true}) {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Padding(
//               padding: EdgeInsets.only(bottom: 0.0),
//               child: Text(headingText, style: TextStyle(
//                   color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 0),
//               child: TextField(
//                 decoration: InputDecoration(
//
//                   hintText:hintText,
//
//                   suffixIcon:  IconButton(onPressed: (){},icon: Icon(Icons.calendar_month,color: suffix?Colors.black87:Colors.transparent,)),
//
//                 ),
//               ),
//             )
//           ],
//         ),
//     );
//   }
// }
