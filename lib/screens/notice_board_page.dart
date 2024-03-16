import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NoticeBoardPage extends StatefulWidget {
  const NoticeBoardPage({Key? key}) : super(key: key);

  @override
  _NoticeBoardPageState createState() => _NoticeBoardPageState();
}

class _NoticeBoardPageState extends State<NoticeBoardPage> {
  List<Map<String, dynamic>> notices = [];
  File? _image;

  int editingIndex = -1;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void addNotice() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      setState(() {
        Map<String, dynamic> noticeData = {
          'title': titleController.text,
          'content': contentController.text,
          'imagePath': _image?.path,
          'class': selectedClass,
        };

        if (editingIndex == -1) {
          // Add a new notice
          notices.add(noticeData);
        } else {
          // Update the existing notice
          notices[editingIndex] = noticeData;
          editingIndex = -1; // Reset editing index
        }

        // Clear input fields
        titleController.clear();
        contentController.clear();
        _image = null;
        selectedClass = 'All'; // Reset to default value
      });
    }
  }

  bool isAddingNotice = false;
  String selectedClass = 'All'; // Default value for dropdown

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
                  child:
                      Text('Add Notice', style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
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
                        onPressed: getImage,
                        child: Text('Add Image',
                            style: TextStyle(color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(double.infinity)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Post the notice and switch back to the button
                      addNotice();
                      setState(() {
                        isAddingNotice = false;
                      });
                    },
                    child: Text(
                        editingIndex == -1 ? 'Post Notice' : 'Update Notice',
                        style: TextStyle(color: Colors.black)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      fixedSize: MaterialStateProperty.all<Size>(
                          Size.fromWidth(double.infinity)),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  final notice = notices[index];
                  return Card(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              notice['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(notice['content']),
                          SizedBox(height: 5),
                          if (notice['imagePath'] != null)
                            Image.file(File(notice['imagePath'])),
                          SizedBox(height: 5),
                          Text('Class: ${notice['class']}'),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Set notice data to the input fields for editing
                                    setState(() {
                                      titleController.text = notice['title'];
                                      contentController.text = notice['content'];
                                      _image = notice['imagePath'] != null
                                          ? File(notice['imagePath'])
                                          : null;
                                      selectedClass = notice['class'];
                                      isAddingNotice = true;
                                      editingIndex = index; // Set editing index
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Delete the notice
                                    setState(() {
                                      notices.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
