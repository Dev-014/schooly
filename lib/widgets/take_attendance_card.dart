import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:practice/widgets/snack_bar.dart';
import 'package:practice/widgets/textFieldWidget.dart';
import 'package:provider/provider.dart';

import '../bloc/generic_bloc.dart';
import '../services/get_service /get_service.dart';
import 'button_widget.dart';

class TakeAttendanceCard extends StatefulWidget {
   final String id, email, studentName;
  int attendedClass, totalClass;
  Function? editSubject, attendedClassFun, notAttendedClassFun, deleteSubject;
  Map<String, bool>? markedAttendance;

  TakeAttendanceCard({
   required this.id,
    required this.email,
    this.markedAttendance,
    required this.studentName,
    required this.attendedClass,
    required this.totalClass,
    required this.editSubject,
    required this.attendedClassFun,
    required this.notAttendedClassFun,
    required this.deleteSubject,
  });



  @override
  State<TakeAttendanceCard> createState() => _TakeAttendanceCardState();
}

class _TakeAttendanceCardState extends State<TakeAttendanceCard> {

  TextEditingController _subjectName = TextEditingController();
  TextEditingController _attended = TextEditingController();
  TextEditingController _total = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd_MM_yyyy').format(selectedDate!);
      });
    }
  }




  void showEditBox() {
    _subjectName.text = widget.studentName;
    _attended.text = widget.attendedClass.toString();
    // _total.text = widget.totalClass.toString();
    showDialog(
      context: context,
      builder: (context) {
        return Card(
          margin: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).viewInsets.bottom - 60
                  : MediaQuery.of(context).size.height * 0.55,
              0,
              0),
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textfieldWidget(
                    "Enter subject name", Icons.subject, false, _subjectName),
                SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
                // textfieldWidget("Enter no of classes attended", Icons.school,
                //     false, _attended),
                SizedBox(height: 10),
                textfieldWidget(
                    "Attendance Status", Icons.schema, false, _total),
                buttonWidget(
                  context,
                  "Update Attendance",
                      () {
                    editSubject();
                    Navigator.of(context).pop();
                  },
                  false,
                  16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void editAttendance({required String studentID,String? status, String? date}) {
    FirebaseFirestore.instance
        .collection("NewSchool")
        .doc("G0ITybqOBfCa9vownMXU")
        .collection("attendence")
        .doc("y2Yes9Dv5shcWQl9N9r2")
        .collection("attendance ")
        .doc(studentID)
        .update({
      "attendance.${date}": "${status!.toLowerCase()}"
    }).then((value){

      print("success");
    }).catchError((error) {
      print('Error updating student: $error');
    });
  }
  void editSubject() {
    if (_subjectName.text.isEmpty ||
        _total.text.isEmpty ||
        _attended.text.isEmpty) {
      snackbarWidget(context, "All the fields must be field", Colors.red);
      return;
    }


    editAttendance(studentID: widget.id,date: dateController.text,status: _total.text );
  }

  void attendedClass() {
    setState(() {
      // widget.totalClass++;
      widget.attendedClass++;
    });
    widget.attendedClassFun!();
  }

  void notAttendedClass() {
    setState(() {
      // widget.totalClass++;
    });
    widget.notAttendedClassFun!();
  }

  get status {
    if (widget.attendedClass == 0 && widget.totalClass == 0) {
      return "NA";
    }
    if ((widget.attendedClass / widget.totalClass) * 100 >= 75) {
      var x = (4 * widget.attendedClass - 3 * widget.totalClass) / 3;
      x = x < 1 ? 0 : x;
      if (x == 0) {
        return "You can't miss any class.";
      }
      if (int.parse(x.toStringAsFixed(0)) == 1) {
        return "You can miss next class.";
      }
      return "You can miss next ${x.toStringAsFixed(0)} classes.";
    }
    var x =
    (widget.totalClass - widget.attendedClass).toStringAsFixed(0);
    if (int.parse(x) == 1) {
      return "Please attend the next class.";
    }
    return "Please attend next ${x} classes.";
  }

  // void showDeleteBox() {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.error,
  //     animType: AnimType.scale,
  //     title: 'Are you sure?',
  //     desc: 'This action cannot be undone.',
  //     btnCancelOnPress: () {},
  //     btnOkOnPress: () {
  //       widget.deleteSubject(widget.id);
  //     },
  //     btnCancelText: "CANCEL",
  //     btnOkText: "OK",
  //   ).show();
  // }
  var genericProvider;
  Map<String, bool> attendanceMap = {};
  bool isAttended = false;
  // void getAttendanceMap()async{
  //
  //   Map<String, bool> mapofAtt = await GetService.getTodayAttendance(token: genericProvider.sessionToken, context: context);
  //   attendanceMap.addAll(mapofAtt) ;
  //   print( attendanceMap[widget.id]);
  // }
  void initState() {
    // documentSnap = _fetchData();
    // print("LLLLLLLL");
    print(widget.id);
    genericProvider = Provider.of<GenericProvider>(context, listen: false);

    print("isAttended");
    print(widget.markedAttendance);
    isAttended = widget.markedAttendance?[widget.id] ?? false;
    print(widget.markedAttendance?[widget.id]);
    print(isAttended);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
    );
    return Card(
      margin: const EdgeInsets.fromLTRB(8, 10, 8, 5),
      color: ConstantColors.backGroundColor,
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),


        height: 80,

        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),
          color: isAttended ? Colors.green.withOpacity(.2) : Colors.white,
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.white,
            //     blurStyle: BlurStyle.outer,
            //     blurRadius: 4.0,
            //     // offset: Offset(0.0, 0.0),
            //   )
            // ]
          // color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),


                  )
                ),
                width: 10,
                height: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7.0,bottom: 4),
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),
                ),
                Text(
                  widget.studentName,
                  style: textStyle,
                )
                // Text(
                //   "${widget._id}",
                //   style: textStyle,
                // ),



                // Text(
                //   "Status: ${status}",
                //   style: TextStyle(
                //     fontSize: 15.1,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w500,
                //     letterSpacing: 0.2,
                //   ),
                // ),
                // Row(
                //   children: [
                //     CircleAvatar(
                //       backgroundColor: Colors.white,
                //       child: IconButton(
                //         onPressed: () {
                //           showEditBox();
                //         },
                //         icon: const Icon(
                //           Icons.edit,
                //           size: 20,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     CircleAvatar(
                //       backgroundColor: Colors.white,
                //       child: IconButton(
                //           onPressed: () {
                //             showDeleteBox();
                //           },
                //           icon: const Icon(
                //             Icons.delete,
                //             size: 20,
                //           )),
                //     ),
                //   ],
                // )
              ],
            ),
            Spacer(flex: 3,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      isAttended =true;

                      attendedClass();
                    });
                  }, icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                  )),
                  // CircleAvatar(
                  //   backgroundColor: Colors.green,
                  //   child: IconButton(
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       setState(() {
                  //         isAttended =true;
                  //
                  //         attendedClass();
                  //       });
                  //     },
                  //     icon: const Icon(
                  //       Icons.check,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  IconButton(onPressed: (){

                    setState(() {
                      isAttended =false;
                      notAttendedClass();
                    });
                  }, icon: Icon(Icons.close,color: Colors.red,)),
                  // CircleAvatar(
                  //   backgroundColor: Colors.red,
                  //   child: IconButton(
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       setState(() {
                  //         isAttended =false;
                  //         notAttendedClass();
                  //       });
                  //
                  //     },
                  //     icon: const Icon(
                  //       Icons.close,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     // CircularPercentIndicator(
            //     //   radius: 35.0,
            //     //   lineWidth: 7.0,
            //     //   percent: widget.attendedClass == 0 && widget.totalClass == 0
            //     //       ? 0
            //     //       : (widget.attendedClass / widget.totalClass),
            //     //   center: widget.attendedClass == 0 && widget.totalClass == 0
            //     //       ? Text(
            //     //     "0%",
            //     //     style: textStyle,
            //     //   )
            //     //       : Text(
            //     //     "${(widget.attendedClass / widget.totalClass * 100).toStringAsFixed(0)}%",
            //     //     style: textStyle,
            //     //   ),
            //     //   progressColor:
            //     //   (widget.attendedClass / widget.totalClass * 100) >= 75
            //     //       ? Colors.green
            //     //       : Colors.red,
            //     // ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
