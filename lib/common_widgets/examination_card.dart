import 'package:flutter/material.dart';

class ExaminationCard extends StatefulWidget {
  final String title;
  final String date;
  const ExaminationCard({super.key,required this.title,required this.date});

  @override
  State<ExaminationCard> createState() => _ExaminationCardState();
}

class _ExaminationCardState extends State<ExaminationCard> {
  bool toogle =false;


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          color: Color(0xffd4ffea),

          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top: 16.0,bottom: 16,left: 16,right: 6),
        child: InkWell(
          onTap: (){
            toogle = !toogle;
            setState(() {

            });
          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text("Science Basic Assessment Test",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    ),
                    const Text("Duration: 30 Min", style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: (toogle)?Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text("Score: 40/200",style: TextStyle(color: Colors.green,fontWeight: FontWeight.normal,fontSize: 12),),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 7),
                              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(18)),
                              child: const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Icon(Icons.play_arrow,size: 13,color: Colors.white,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text("Completed", style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.white),),
                                  ),
                                ],
                              ))
                        ],
                      ):Container(
                        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                        decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(18)),
                          child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Icon(Icons.play_arrow,size: 13,color: Colors.white,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text("Start Test", style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.white),),
                          ),
                        ],
                      ),),
                    ),


                  ],
                ),
                IconButton(icon:const Icon(Icons.arrow_forward_ios_rounded,size: 14,),onPressed: (){},),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
