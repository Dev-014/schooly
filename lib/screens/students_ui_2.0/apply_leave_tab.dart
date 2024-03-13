import 'package:flutter/material.dart';
import 'package:practice/utils/constants_colors.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({super.key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  @override
  Widget build(BuildContext context) {
    late DateTime _selectedDate;

    @override
    void initState() {
      super.initState();
      _selectedDate = DateTime.now();
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Card(
              elevation: 0,
color: Colors.white,
              // color: ConstantColors.backGroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text("Instructions",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 16),),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text("1. Same day leave can be applied before 7:00 AM",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text("2. Only Parent can apply for leave on  behalf of their child.",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
                    )

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Text("From Date", style: TextStyle(
                      color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: TextField(
                    decoration: InputDecoration(

                      hintText:"dd MMM YYYY",

                      suffixIcon:  IconButton(onPressed: (){_selectDate(context);},icon: Icon(Icons.calendar_month,color: Colors.black87)),

                    ),
                  ),
                )
              ],
            ),
          ),
          // applyLeaveTextField(hintText: "dd MMM YYYY", headingText: "From Date"),
          applyLeaveTextField(hintText: "dd MMM YYYY", headingText: "To Date"),
          applyLeaveTextField(suffix: false, hintText: "Enter comment here", headingText: "Reason"),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: SizedBox(
              height: 35,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("APPLY",style: TextStyle(fontSize: 16,color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xff11489c),),)),
          )


        ],
      ),
    );
  }

  Padding applyLeaveTextField({required String hintText, required String headingText, bool suffix=true}) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: Text(headingText, style: TextStyle(
                  color: Colors.blue,fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: TextField(
                decoration: InputDecoration(

                  hintText:hintText,

                  suffixIcon:  IconButton(onPressed: (){},icon: Icon(Icons.calendar_month,color: suffix?Colors.black87:Colors.transparent,)),

                ),
              ),
            )
          ],
        ),
    );
  }
}
