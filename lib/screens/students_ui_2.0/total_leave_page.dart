import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequestsPage extends StatelessWidget {
  const LeaveRequestsPage({Key? key}) : super(key: key);

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
          "student") // Assuming widget.studentId is the student's document ID
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.data() == null) {
          return Center(
            child: Text('No leave requests found'),
          );
        } else {
          // Retrieve leave applications data
          Map<String, dynamic>? leaveData =
          snapshot.data!.data() as Map<String, dynamic>?;

          if (leaveData == null || !leaveData.containsKey('studentLeave')) {
            return Center(
              child: Text('No leave requests found for this student'),
            );
          }

          List<dynamic> leaveRequests = leaveData['studentLeave'];

          // Filter leave applications based on student ID
          List<dynamic> studentLeaveRequests = leaveRequests
              .where((leave) => leave['stuId'] == 'scholar_1')
              .toList();

          if (studentLeaveRequests.isEmpty) {
            return Center(
              child: Text('No leave requests found for this student'),
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
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                      'Applied Date: ${DateFormat('dd MMM yyyy').format(appliedDate)}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Reason: ${leaveRequest['reason']}'),
                      Text('From Date: ${leaveRequest['fromDate']}'),
                      Text('To Date: ${leaveRequest['toDate']}'),
                      Text('Teacher Approval: ${leaveRequest['teacherApproval']}'),
                      Text('Principal Approval: ${leaveRequest['principalApproval']}'),
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
                        icon: Icon(Icons.edit),
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
                                "student") // Assuming widget.studentId is the student's document ID
                                .update({
                              'studentLeave':
                              FieldValue.arrayRemove([leaveRequest])
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                              Text('Leave request deleted successfully'),
                            ));
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Failed to delete leave request. Please try again later.'),
                            ));
                          }
                        },
                        icon: Icon(Icons.delete),
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
      title: Text('Edit Leave Request'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From Date'),
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
                  icon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('To Date'),
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
                  icon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Reason'),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
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
          child: Text('Cancel'),
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
                "student"); // Assuming widget.studentId is the student's document ID

// Fetch the current leave requests
            DocumentSnapshot leaveSnapshot = await leaveRef.get();

// Get the current studentLeave data
            Map<String, dynamic> leaveData =
            leaveSnapshot.data() as Map<String, dynamic>;

// Extract the list of leave applications
            List<dynamic> leaveRequests = leaveData['studentLeave'];

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
              // Update the leave request in the array and save it back to Firestore
              await leaveRef.update({
                'studentLeave': leaveRequests,
              });

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Leave request updated successfully'),
              ));
              Navigator.of(context).pop();
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Failed to update leave request. Please try again later.'),
              ));
            }
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}