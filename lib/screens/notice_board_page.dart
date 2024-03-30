import 'dart:convert';
import 'dart:html' as html; // Import the 'dart:html' library for interacting with HTML elements
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeBoardPage extends StatefulWidget {
  const NoticeBoardPage({Key? key}) : super(key: key);

  @override
  _NoticeBoardPageState createState() => _NoticeBoardPageState();
}

class _NoticeBoardPageState extends State<NoticeBoardPage> {
  List<Map<String, dynamic>> notices = [];
  int editingIndex = -1;
  String? downloadUrl;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future<void> uploadFile(html.File file) async {
    try {
      // Create a reference to the Firebase Storage location
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('uploads/${file.name}');

      // Read the file as array buffer
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      // Wait for the file to be read
      await reader.onLoad.first;

      // Convert the array buffer data to bytes
      final data = reader.result as List<int>;

      // Upload the file to Firebase Storage as a string
      await ref.putString(
        // Convert the file data to a base64 string
        base64.encode(data),
        // Set the format of the uploaded file (you can change this as needed)
        format: firebase_storage.PutStringFormat.base64,
      );

      // Get the download URL of the uploaded file
      downloadUrl = await ref.getDownloadURL();

      // Print the download URL for debugging purposes
      print('Download URL: $downloadUrl');

      // Once the upload is complete, you can proceed to save the download URL to Firestore or perform other operations
    } catch (error) {
      print('Error uploading file: $error');
      // Handle upload errors here
    }
  }


  void addNotice() async {
    // Check if all required fields are filled and download URL is available
    if (titleController.text.isNotEmpty &&
        contentController.text.isNotEmpty &&
        downloadUrl != null) {
      // Construct the notice data
      final Map<String, dynamic> noticeData = {
        'title': titleController.text,
        'content': contentController.text,
        'class': selectedClass,
        'imageSrc': downloadUrl!,
      };

      try {
        // Get a reference to the Firestore document
        final DocumentReference documentReference =
        FirebaseFirestore.instance
            .collection('NewSchool')
            .doc('G0ITybqOBfCa9vownMXU')
            .collection('attendence')
            .doc('y2Yes9Dv5shcWQl9N9r2')
            .collection('noticeBoard')
            .doc('allNotice');

        // Update the Firestore document with the notice data
        await documentReference.update({
          'notice': FieldValue.arrayUnion([noticeData])
        });

        // Print a success message
        print('Notice added successfully');
      } catch (error) {
        // Handle Firestore errors
        print('Failed to add notice: $error');
      }

      // Clear input fields and reset variables
      setState(() {
        titleController.clear();
        contentController.clear();
        downloadUrl = null;
        selectedClass = 'All';
      });
    }
  }

  bool isAddingNotice = false;
  String selectedClass = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        title: const Align(
            alignment: Alignment.centerLeft, child: Text("Notice Board")),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isAddingNotice)
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAddingNotice = true;
                    });
                  },
                  child: Text('Add Notice', style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromWidth(double.infinity)),
                  ),
                ),
              )
            else
              Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      hintText: 'Write the notice here',
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: selectedClass,
                        items: <String>[
                          'All',
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedClass = newValue!;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // Open file picker dialog
                          final html.FileUploadInputElement input = html.FileUploadInputElement();
                          input.accept = 'image/*'; // Accept only image files
                          input.click(); // Trigger file picker dialog
                          await input.onChange.first; // Wait for user to select a file

                          // Upload the selected file
                          final file = input.files!.first;
                          await uploadFile(file);
                        },
                        child: Text('Add Image', style: TextStyle(color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(double.infinity)),
                        ),
                      ),

                    ],
                  ),
                  // if (downloadUrl != null) Text('Selected File: ${path.basename(downloadUrl!)}'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      addNotice();
                      setState(() {
                        isAddingNotice = false;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(double.infinity)),
                    ),
                    child: Text(
                        editingIndex == -1 ? 'Post Notice' : 'Update Notice',
                        style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('NewSchool')
                    .doc('G0ITybqOBfCa9vownMXU')
                    .collection('attendence')
                    .doc('y2Yes9Dv5shcWQl9N9r2')
                    .collection('noticeBoard')
                    .doc('allNotice')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('No notices found.'),
                    );
                  }
                  List<dynamic> notices =
                      snapshot.data!['notice'] ?? <dynamic>[];
                  return ListView.builder(
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> notice =
                      notices[index] as Map<String, dynamic>;
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  notice['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(notice['content']),
                              SizedBox(height: 5),
                              Text('Class: ${notice['class']}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      editNotice(
                                        notice['id'],
                                        notice['title'],
                                        notice['content'],
                                        notice['class'],
                                        notice['imageSrc'],
                                      );
                                    },
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
                                            .collection('noticeBoard')
                                            .doc(
                                            "allNotice") // Assuming widget.studentId is the student's document ID
                                            .update({
                                          'notice':
                                          FieldValue.arrayRemove([notice])
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'notice deleted successfully'),
                                        ));
                                      } catch (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Failed to delete notice. Please try again later.'),
                                        ));
                                      }
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void editNotice(
      String id,
      String currentTitle,
      String currentContent,
      String currentClass,
      String currentImageSrc,
      ) async {
    // Update notice in Firestore
    try {
      await FirebaseFirestore.instance
          .collection('NewSchool')
          .doc('G0ITybqOBfCa9vownMXU')
          .collection('attendence')
          .doc('y2Yes9Dv5shcWQl9N9r2')
          .collection('noticeBoard')
          .doc('allNotice')
          .update({
        'notice': FieldValue.arrayRemove([
          {
            'id': id,
            'title': currentTitle,
            'content': currentContent,
            'class': currentClass,
            'imageSrc': currentImageSrc,
          }
        ])
      });
    } catch (error) {
      print('Failed to update notice: $error');
      return; // Exit the method if Firestore update fails
    }

    // Set the current values to the input fields for editing
    setState(() {
      titleController.text = currentTitle;
      contentController.text = currentContent;
      selectedClass = currentClass;
      // downloadUrl = currentImageSrc.isNotEmpty ? File(currentImageSrc) : null;
      editingIndex = int.parse(id); // Set editing index for tracking
      isAddingNotice = true; // Switch to the adding notice mode
    });
  }
}
