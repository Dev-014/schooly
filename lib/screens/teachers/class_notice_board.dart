import 'package:flutter/material.dart';
import 'package:practice/utils/constants_colors.dart';

class ClassNoticeBoard extends StatefulWidget {
  const ClassNoticeBoard({super.key});

  @override
  State<ClassNoticeBoard> createState() => _ClassNoticeBoardState();
}

class _ClassNoticeBoardState extends State<ClassNoticeBoard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15162b).withOpacity(.99),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff5842d3),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  width: 400,
                  child: AlertDialog(
                      clipBehavior: Clip.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      backgroundColor:
                          Color(0xff15162b), // Set dialog background color

                      content: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          color: Color(0xff15162b), // Set form background color
                          child: Form(
                            key: _formKey,
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,

                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 16),
                                      child: Text(
                                        "Assignment",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color:
                                                ConstantColors.secondary_color,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                noticeBoardTextField("Class"),
                                noticeBoardTextField("Section"),
                                noticeBoardTextField("Title"),

                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      noticeBoardButton("Attach"),
                                      noticeBoardButton("Calender"),


                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ConstantColors.secondary_color,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 33),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)))),
                                  onPressed: () {
                                    // Add functionality for form submission
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 10,
        backgroundColor: Color(0xff15162b),
        title: Text(
          "Class 10C",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            classNoticeCard(),
            classDocumentNoticeCard(),
            classNoticeCard(),
            classNoticeCard(),
          ],
        ),
      ),
    );
  }

  ElevatedButton noticeBoardButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              ConstantColors.primary_color,
          elevation: 0,
          side: BorderSide(
              color: ConstantColors
                  .secondary_color)),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(
                    horizontal: 4.0,vertical: 9),
            child: Text(
              text,
              style: TextStyle(
                  color: ConstantColors
                      .secondary_color),
            ),
          ),
          Icon(
            Icons.attach_file_outlined,
            color: ConstantColors
                .secondary_color,
          ),
        ],
      ),
    );
  }

  Padding noticeBoardTextField(String heading) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              heading,
              style: TextStyle(color: ConstantColors.secondary_color),
            ),
          ),
          SizedBox(
            height: 35,
            child: TextFormField(
              style: TextStyle(color: Colors.white), // Set text color
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                // labelText: 'Class',
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ConstantColors.secondary_color)),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding classNoticeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0), // Adjust the value here for different roundness
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 12),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 25,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                "Mr. Savio Martin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              "Posted today 9:00AM",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.keyboard_option_key))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Good Morning class, today you will get a quiz with one day to finish it off. Don't worry it isn't too difficult and can be easily finished. Kindly do it properly and turn it in. Just apply what we have learned in the class and you ll be goog to go. ",
                  style: TextStyle(height: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 8,
                ),
                child: Divider(
                  height: 5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding classDocumentNoticeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0), // Adjust the value here for different roundness
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 12),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 25,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                "Mr. Savio Martin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              "Posted today 9:00AM",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.keyboard_option_key))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xff5842d3)),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.book_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Task : Literature Quiz 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 1,
                                ),
                                Text(
                                  "Due Tommorrow",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 8,
                ),
                child: Divider(
                  height: 5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
