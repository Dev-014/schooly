import 'package:flutter/material.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/widgets/loader_button.dart';
import 'package:practice/widgets/student_wrapper.dart';
import 'package:provider/provider.dart';

import '../../bloc/generic_bloc.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    return  StudentWrapper(widget:
        AddClass(), title: "Add Class");
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


class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LoaderElevatedButton(onPressed: ()async{

           await  AddService.addClasses(context: context,token: genericProvider.sessionToken);
          },buttonText: "Upload Class&Subject",),
        ),
      ),
    );
  }
}
