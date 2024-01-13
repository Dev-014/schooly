import 'package:flutter/material.dart';

class MultiMediaCard extends StatefulWidget {
  final String title;
  final String date;
  const MultiMediaCard({super.key,required this.title,required this.date});

  @override
  State<MultiMediaCard> createState() => _MultiMediaCardState();
}

class _MultiMediaCardState extends State<MultiMediaCard> {
  bool toogle =false;


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          color: Color(0xffffd4d4),

          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
        child: InkWell(
          onTap: (){
            toogle = !toogle;
            setState(() {

            });
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: Container(

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                      color: Colors.white
                      ,border: Border.all(color: Colors.black,width: 1),),
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                  alignment: Alignment.center,
                    child: const Center(child: Text("ZIP", style: TextStyle(fontWeight: FontWeight.normal,),))),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text("Social Science Syllabus",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                  Text("Syllabus for 2023 batch", style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                  Text("12 pages / 360 KB", style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),


                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
