import 'package:fixnum/fixnum.dart';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';
import '../../services/other/leave_page/leave_page_service.dart';

class ApplyLeavePage extends StatefulWidget {
  final bool isStudent;
  const ApplyLeavePage({ required this.isStudent ,Key? key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  late DateTime _selectedDate;
  late DateTime _fromDate;
  late DateTime _toDate;
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
        controller.text = (_selectedDate.millisecondsSinceEpoch ~/ 1000).toString();
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
                  onPressed: (){
                    Int64 fromDate = Int64(DateTime.parse(_fromDateController.text.trim()).millisecondsSinceEpoch ~/ 1000);
                    Int64 toDate = Int64(DateTime.parse(_toDateController.text.trim()).millisecondsSinceEpoch) ~/ 1000;
                    AddService.requestLeave(leave: Leave(reason: _reasonController.text.trim(),from:fromDate,to: toDate), token: genericProvider.sessionToken, context: context);

                  },
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



}

