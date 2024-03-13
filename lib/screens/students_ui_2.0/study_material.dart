import 'package:flutter/material.dart';
import 'package:practice/screens/multimedia_page.dart';
import 'package:practice/utils/constants_colors.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({super.key});

  @override
  State<StudyMaterial> createState() => _StudyMaterialState();
}

class _StudyMaterialState extends State<StudyMaterial> {
  List<String> subjects = [
    "Math", "Science", "English", "History", "Geography"
  ];

  List<String> filteredSubjects = [];
  String query = "";
  @override
  void initState() {
    super.initState();

    // Set filteredSubjects to all subjects initially
    filteredSubjects = subjects;
  }

  @override
  Widget build(BuildContext context) {

    filterSubjects() {
      if(query.isEmpty) {
        // If query is empty, return all subjects
        setState(() {
          filteredSubjects = subjects;
        });

      } else {

        // Filter subjects based on query
        List<String> results = subjects
            .where((subject) =>
            subject.toLowerCase().contains(query.toLowerCase()))
            .toList();

        setState(() {
          filteredSubjects = results;
        });

      }
    }
    return  Scaffold(
      backgroundColor: ConstantColors.backGroundColor,
      // backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Study Material"),
      // backgroundColor: ConstantColors.primary_color,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 18),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // fillColor: Color(0xFFF2F2F2),
                prefixIcon: Icon(Icons.search),
                suffixIcon: query.length > 0
                    ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      query = '';
                      filterSubjects();
                    });
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                  filterSubjects();
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: filteredSubjects.map((subject) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MultiMediaPage();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Card(
shape: RoundedRectangleBorder(
  borderRadius:  BorderRadius.circular(30)
),
                      color: Colors.white,
                      clipBehavior: Clip.hardEdge,
                      // padding: EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.book_outlined,size: 30,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                  child: Text(
                                      subject,
                                      style: TextStyle(fontSize: 18.0,color: Colors.black)),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),


    );
  }
}
