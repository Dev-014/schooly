import 'package:flutter/material.dart';
import 'package:practice/screens/multimedia_page.dart';

class FeeDetailCard extends StatefulWidget {
  final String title;
  final String date;
  const FeeDetailCard({super.key,required this.title,required this.date});

  @override
  State<FeeDetailCard> createState() => _FeeDetailCardState();
}

class _FeeDetailCardState extends State<FeeDetailCard> {
  bool toogle =false;


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          // color: Color(0xffd5f5ff),

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
          child:   Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("School Fee for January",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           const Text("Rs 16,000", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                elevation: 0, // Reduces the elevation.
                                shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(10), // Adds a border radius.
                                )),onPressed: (){}, child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Text("Paid", style: TextStyle(color: Colors.white),),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("06 May", style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Icon(Icons.arrow_drop_down,),
                      )

                    ],
                  ),

                ],
              ),
              (toogle)?Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(height: 10,),
                  ),

                  for(int i =0;i<4;i++ )
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text("Total Fee", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        Text("Rs 14,500"),
                      ],
                    )
                ],
              ):const SizedBox()

            ],
          ),
        ),
      ),
    );
  }
}
