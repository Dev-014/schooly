import 'package:flutter/material.dart';
import 'package:practice/screens/not_clear/class_notice_board.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff15162b),
      appBar: AppBar(
        backgroundColor: Color(0xff15162b),
        title: Text("Classes",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [CircleAvatar(backgroundColor: Colors.grey,radius: 15,)],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add,),backgroundColor:Color(0xff5842d3) ,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return ClassNoticeBoard();}));
            },child: classCard("Class 10A")),
            classCard("Class 9A"),
            classCard("Class 8A"),
            classCard("Class 7A"),
            classCard("Class 6A"),
            classCard("Class 5B"),
          ],
        ),
      ),
    );
  }

  Padding classCard(String className) {
    return Padding(

padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
child:   Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    color: Color(0xff767686).withOpacity(.3),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(className,style: TextStyle(color: Color(0xff767686),fontWeight: FontWeight.bold,fontSize: 20),),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.person_pin ,color: Color(0xff767686) ,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text("75 Students",style: TextStyle(color: Color(0xff767686),),),
                  ),
                ],
              ),
              ElevatedButton(onPressed: (){}, child: Text("View Students"),style:ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xff5842d3), // Text color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),)


            ],
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined,color: Color(0xff767686),)),

          ],
        ),
      )
    ],
  ),
),
);
  }
}
