import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../bloc/firebase_storage.dart';

class NoticeBoardPage extends StatefulWidget {
  const NoticeBoardPage({Key? key}) : super(key: key);

  @override
  _NoticeBoardPageState createState() => _NoticeBoardPageState();
}

class _NoticeBoardPageState extends State<NoticeBoardPage> {
  List<Map<String, dynamic>> notices = [];
  int editingIndex = -1;
  String file = "";
  bool isUploading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  var store = FirebaseStorageService();

  void addNotice() async {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      // Construct the notice data
      final Map<String, dynamic> noticeData = {
        'title': titleController.text,
        'content': contentController.text,
        'class': selectedClass,
        'imageSrc': file,
      };

      try {
        // Get a reference to the Firestore document
        final DocumentReference documentReference = FirebaseFirestore.instance
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
        file = "";
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
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size.fromWidth(double.infinity)),
                  ),
                  child: const Text('Add Notice',
                      style: TextStyle(color: Colors.black)),
                ),
              )
            else
              Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      hintText: 'Write the notice here',
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
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
                          setState(() {
                            isUploading = true;
                          });
                          file = (await store.uploadFileToFirebase())!;
                          setState(() {
                            isUploading = false;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size.fromWidth(double.infinity)),
                        ),
                        child: (isUploading)
                            ? const CircularProgressIndicator()
                            : const Text('Add Image',
                                style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                  if (file != "")
                    Container(
                        height: 100, width: 100, child: Image.network(file)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      addNotice();
                      setState(() {
                        isAddingNotice = false;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(double.infinity)),
                    ),
                    child: Text(
                        editingIndex == -1 ? 'Post Notice' : 'Update Notice',
                        style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            const SizedBox(height: 20),
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Image.network(notice['imageSrc'])),
                              ),
                              const SizedBox(height: 10),
                              Text(notice['content']),
                              const SizedBox(height: 5),
                              Text('Class: ${notice['class']}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
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
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'notice deleted successfully'),
                                        ));
                                      } catch (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Failed to delete notice. Please try again later.'),
                                        ));
                                      }
                                    },
                                    icon: const Icon(Icons.delete),
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
    String? currentImageSrc, // Make currentImageSrc nullable
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
            'imageSrc': currentImageSrc, // Use currentImageSrc directly
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
      file = currentImageSrc ?? "";
      editingIndex = int.parse(id); // Set editing index for tracking
      isAddingNotice = true; // Switch to the adding notice mode
    });
  }
}
