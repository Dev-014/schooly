import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:practice/widgets/snack_bar.dart';
import 'package:practice/widgets/textFieldWidget.dart';

import 'button_widget.dart';

class TakeAttendanceCard extends StatefulWidget {
  String _id, email, studentName;
  int attendedClass, totalClass, __v;
  Function editSubject, attendedClassFun, notAttendedClassFun, deleteSubject;

  TakeAttendanceCard(
      this._id,
      this.email,
      this.studentName,
      this.attendedClass,
      this.totalClass,
      this.__v,
      this.editSubject,
      this.attendedClassFun,
      this.notAttendedClassFun,
      this.deleteSubject,
      );



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


    editAttendance(studentID: widget._id,date: dateController.text,status: _total.text );
  }

  void attendedClass() {
    setState(() {
      // widget.totalClass++;
      widget.attendedClass++;
    });
    widget.attendedClassFun();
  }

  void notAttendedClass() {
    setState(() {
      // widget.totalClass++;
    });
    widget.notAttendedClassFun();
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

  void showDeleteBox() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Are you sure?',
      desc: 'This action cannot be undone.',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        widget.deleteSubject(widget._id);
      },
      btnCancelText: "CANCEL",
      btnOkText: "OK",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
    );
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 10, 8, 5),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 125,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  widget.studentName,
                  style: textStyle,
                ),
              ),
              Text(
                "Attendance ${widget.attendedClass}/${widget.totalClass}",
                style: textStyle,
              ),
              // Text(
              //   "Status: ${status}",
              //   style: TextStyle(
              //     fontSize: 15.1,
              //     color: Colors.black,
              //     fontWeight: FontWeight.w500,
              //     letterSpacing: 0.2,
              //   ),
              // ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        showEditBox();
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          showDeleteBox();
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                        )),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 7.0,
                percent: widget.attendedClass == 0 && widget.totalClass == 0
                    ? 0
                    : (widget.attendedClass / widget.totalClass),
                center: widget.attendedClass == 0 && widget.totalClass == 0
                    ? Text(
                  "0%",
                  style: textStyle,
                )
                    : Text(
                  "${(widget.attendedClass / widget.totalClass * 100).toStringAsFixed(0)}%",
                  style: textStyle,
                ),
                progressColor:
                (widget.attendedClass / widget.totalClass * 100) >= 75
                    ? Colors.green
                    : Colors.red,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        attendedClass();
                      },
                      icon: const Icon(
                        Icons.check,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        notAttendedClass();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
