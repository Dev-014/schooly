import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../bloc/generic_bloc.dart';

class TeacherLeaveRequest extends StatefulWidget {
  const TeacherLeaveRequest({Key? key}) : super(key: key);

  @override
  State<TeacherLeaveRequest> createState() => _TeacherLeaveRequestState();
}

class _TeacherLeaveRequestState extends State<TeacherLeaveRequest> {
  var genericProvider;
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('NewSchool')
          .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
          .collection('leave_application')
          .doc(
          "teacher") // Assuming widget.studentId is the student's document ID
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.data() == null) {
          return const Center(
            child: Text('No leave requests found'),
          );
        } else {
          // Retrieve leave applications data
          Map<String, dynamic>? leaveData =
          snapshot.data!.data() as Map<String, dynamic>?;

          if (leaveData == null || !leaveData.containsKey('teacherLeave')) {
            return const Center(
              child: Text('No leave requests found for this teacher'),
            );
          }

          List<dynamic> leaveRequests = leaveData['teacherLeave'];

          // Filter leave applications based on student ID
          List<dynamic> studentLeaveRequests = leaveRequests
              .where((leave) => leave['tId'] == genericProvider.empID)
              .toList();

          if (studentLeaveRequests.isEmpty) {
            return const Center(
              child: Text('No leave requests found for this teacher'),
            );
          }

          return ListView.builder(
            itemCount: studentLeaveRequests.length,
            itemBuilder: (BuildContext context, int index) {
              // Extract leave request data
              Map<String, dynamic> leaveRequest = studentLeaveRequests[index];

              // Convert timestamp to DateTime format
              DateTime appliedDate =
              (leaveRequest['appliedDate'] as Timestamp).toDate();

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                      'Applied Date: ${DateFormat('dd MMM yyyy').format(appliedDate)}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reason: ${leaveRequest['reason']}'),
                      Text('From Date: ${leaveRequest['fromDate']}'),
                      Text('To Date: ${leaveRequest['toDate']}'),
                      Text(
                          'Principal Approval: ${leaveRequest['principalApproval']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Show edit leave dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditLeaveDialog(
                                leaveRequest: leaveRequest,
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          // Delete the leave request
                          try {
                            await FirebaseFirestore.instance
                                .collection('NewSchool')
                                .doc(
                                "G0ITybqOBfCa9vownMXU") // Update with your document ID
                                .collection('attendence')
                                .doc(
                                'y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
                                .collection('leave_application')
                                .doc(
                                "teacher") // Assuming widget.studentId is the student's document ID
                                .update({
                              'teacherLeave':
                              FieldValue.arrayRemove([leaveRequest])
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                              Text('Leave request deleted successfully'),
                            ));
                          } catch (error) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Failed to delete leave request. Please try again later.'),
                            ));
                          }
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

class EditLeaveDialog extends StatefulWidget {
  final Map<String, dynamic> leaveRequest;

  const EditLeaveDialog({Key? key, required this.leaveRequest})
      : super(key: key);

  @override
  _EditLeaveDialogState createState() => _EditLeaveDialogState();
}

class _EditLeaveDialogState extends State<EditLeaveDialog> {
  late TextEditingController _fromDateController;
  late TextEditingController _toDateController;
  late TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _fromDateController =
        TextEditingController(text: widget.leaveRequest['fromDate']);
    _toDateController =
        TextEditingController(text: widget.leaveRequest['toDate']);
    _reasonController =
        TextEditingController(text: widget.leaveRequest['reason']);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Leave Request'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('From Date'),
            TextField(
              controller: _fromDateController,
              decoration: InputDecoration(
                hintText: 'Select date',
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _fromDateController.text =
                            DateFormat('dd MMM yyyy').format(picked);
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('To Date'),
            TextField(
              controller: _toDateController,
              decoration: InputDecoration(
                hintText: 'Select date',
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      setState(() {
                        _toDateController.text =
                            DateFormat('dd MMM yyyy').format(picked);
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reason'),
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                hintText: 'Enter reason',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            // Retrieve existing leave request data
            // Update the leave request directly in Firestore
            DocumentReference leaveRef = FirebaseFirestore.instance
                .collection('NewSchool')
                .doc("G0ITybqOBfCa9vownMXU") // Update with your document ID
                .collection('attendence')
                .doc('y2Yes9Dv5shcWQl9N9r2') // Update with your document ID
                .collection('leave_application')
                .doc(
                "teacher"); // Assuming widget.studentId is the student's document ID

// Fetch the current leave requests
            DocumentSnapshot leaveSnapshot = await leaveRef.get();

// Get the current studentLeave data
            Map<String, dynamic> leaveData =
            leaveSnapshot.data() as Map<String, dynamic>;

// Extract the list of leave applications
            List<dynamic> leaveRequests = leaveData['teacherLeave'];

// Find the index of the leave request to be updated
            int indexToUpdate = leaveRequests.indexWhere(
                    (leave) => leave['id'] == widget.leaveRequest['id']);

// Update only the edited fields of the leave request
            leaveRequests[indexToUpdate]['fromDate'] =
                _fromDateController.text.trim();
            leaveRequests[indexToUpdate]['toDate'] =
                _toDateController.text.trim();
            leaveRequests[indexToUpdate]['reason'] =
                _reasonController.text.trim();

            try {
              await leaveRef.update({
                'teacherLeave': leaveRequests,
              });

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Leave request updated successfully'),
              ));
              Navigator.of(context).pop();
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'Failed to update leave request. Please try again later.'),
              ));
            }
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}