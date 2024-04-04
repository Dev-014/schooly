import 'package:flutter/material.dart';
import 'package:practice/screens/multimedia_page.dart';

class FeeDetailCard extends StatefulWidget {
  final String title;
  final String paymentDate;
  final String paymentAmount;
  final String dueDate;
  final String status;

  const FeeDetailCard({super.key,required this.title,required this.paymentDate,required this.paymentAmount,required this.dueDate,required this.status});

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
                        child: Text("Quarterly School Fees",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Text(widget.paymentAmount, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                elevation: 0, // Reduces the elevation.
                                shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(10), // Adds a border radius.
                                )),onPressed: (){}, child:  Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Text(widget.status, style: TextStyle(color: Colors.white),),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.paymentDate, style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),),
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

                  // for(int i =0;i<4;i++ )
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text("Due Date", style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        Text(widget.dueDate),
                      ],
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("Payment Date", style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Text(widget.paymentDate),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("Payment Amount", style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Text(widget.paymentAmount),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("Status", style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      Text(widget.status),
                    ],
                  ),
                ],
              ):const SizedBox()

            ],
          ),
        ),
      ),
    );
  }
}
