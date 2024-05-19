import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/modals/principal.dart';
import 'package:practice/modals/student.dart';
import 'package:practice/utils/constants_colors.dart';
import 'package:provider/provider.dart';

import '../bloc/generic_bloc.dart';
import '../modals/teacher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var genericProvider;
  Student? student;
  Teacher? teacher;
  Principal? principal;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    if(genericProvider.userProfile==UserProfile.student) {
      student = genericProvider.loggedInStudent;
    }
    else if(genericProvider.userProfile == UserProfile.teacher){
      teacher = genericProvider.loggedInTeacher;

    }else{
      principal = genericProvider.loggedInPrincipal;
    }

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ConstantColors.backGroundColor,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(onPressed: ()async{
          Navigator.pop(context);

        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Profile",style: TextStyle(fontSize: 18),)),
        // backgroundColor: Colors.pink,

      ),
      body: (genericProvider.userProfile == UserProfile.student)?
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(flex: 1, child: Container(
                  decoration:  BoxDecoration(
                      color: ConstantColors.backGroundColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: const CircleAvatar(radius: 48, backgroundColor: Colors.black,child: Icon(Icons.person,color: Colors.white,),)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0,bottom: 2),
                          child: Text(student!.studentName,style: const TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.w500),),
                        ),
                      ),
                      Expanded(child: Text("Class"+student!.classs,style:  TextStyle(fontSize:14,color: Colors.black,fontWeight: FontWeight.w200),))

                    ],
                  )
                  // Icon(
                  //   Icons.abc_rounded, size: 40, color: Colors.white,)
          )),
              Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topCenter,
                    width: 400,
                    child: SingleChildScrollView(

                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            profileFields(field_heading: "Roll Number",value: student!.rollNumber.toString()),
                            profileFields(field_heading: "Date of Birth",value: student!.dateOfBirth??"DOB"),
                            profileFields(field_heading: "Blood Group",value: student?.bloodGroup??"Blood Group"),
                            profileFields(field_heading: "Emergency Contact",value: student?.emergencyContact??"9999999999"),
                            profileFields(field_heading: "Position in Class",value: student?.classs??"10"),
                            profileFields(field_heading: "Father's Name",value: student?.fathersName??"Ravindra"),
                            profileFields(
                                field_heading: "Mother's Name", divider: true,value: student?.mothersName??"Shivani"),


                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(

                                child: ElevatedButton(

                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(200, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30)
                                      ),
                                      backgroundColor: Colors.pink,
                                    ),
                                    onPressed: () {},
                                      child: const Text("Ask for Update",style: TextStyle(color: Colors.white),)),
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                ),
              )
            ],
          ):(genericProvider.userProfile == UserProfile.teacher)?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(flex: 1, child: Container(
              decoration:  BoxDecoration(
                  color: ConstantColors.backGroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: const CircleAvatar(radius: 48, backgroundColor: Colors.black,child: Icon(Icons.person,color: Colors.white,),)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0,bottom: 2),
                      child: Text(teacher!.teacherName,style: const TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(child: Text("Class"+teacher!.classs!,style:  TextStyle(fontSize:14,color: Colors.black,fontWeight: FontWeight.w200),))

                ],
              )
            // Icon(
            //   Icons.abc_rounded, size: 40, color: Colors.white,)
          )),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.topCenter,
                width: 400,
                child: SingleChildScrollView(

                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        profileFields(field_heading: "Emp ID",value: teacher!.empId.toString()),
                        profileFields(field_heading: "Date of Birth",value: "DOB"),
                        profileFields(field_heading: "Blood Group",value:"Blood Group"),
                        profileFields(field_heading: "Emergency Contact",value: student?.emergencyContact??"9999999999"),
                        profileFields(field_heading: "Email",value: teacher?.email??"10"),
                        profileFields(field_heading: "Father's Name",value:"Father's Name"),
                        profileFields(
                            field_heading: "Mother's Name", divider: true,value: "Mother's Name"),


                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Center(

                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30)
                                  ),
                                  backgroundColor: Colors.pink,
                                ),
                                onPressed: () {},
                                child: const Text("Ask for Update",style: TextStyle(color: Colors.white),)),
                          ),
                        )

                      ],
                    ),
                  ),
                )
            ),
          )
        ],
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(flex: 1, child: Container(
              decoration:  BoxDecoration(
                  color: ConstantColors.backGroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: const CircleAvatar(radius: 48, backgroundColor: Colors.black,child: Icon(Icons.person,color: Colors.white,),)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0,bottom: 2),
                      child: Text(principal!.principalName,style: const TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Expanded(child: Text("School",style:  TextStyle(fontSize:14,color: Colors.black,fontWeight: FontWeight.w200),))

                ],
              )
            // Icon(
            //   Icons.abc_rounded, size: 40, color: Colors.white,)
          )),
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.topCenter,
                width: 400,
                child: SingleChildScrollView(

                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        profileFields(field_heading: "Email",value: principal!.email.toString()),
                        profileFields(field_heading: "Date of Birth",value: "DOB"),
                        profileFields(field_heading: "Blood Group",value: "Blood Group"),
                        profileFields(field_heading: "Emergency Contact",value: "9999999999"),
                        profileFields(field_heading: "Emp Id",value: principal?.empId),
                        profileFields(field_heading: "Father's Name",value: "fathersName"),
                        profileFields(
                            field_heading: "Mother's Name", divider: true,value: "mothersName"),


                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Center(

                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30)
                                  ),
                                  backgroundColor: Colors.pink,
                                ),
                                onPressed: () {},
                                child: const Text("Ask for Update",style: TextStyle(color: Colors.white),)),
                          ),
                        )

                      ],
                    ),
                  ),
                )
            ),
          )
        ],
      )

    );
  }

  Padding profileFields({required String field_heading, String? value, bool? divider}) {
    return Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 12),
               child: Column(
                 mainAxisAlignment:MainAxisAlignment.start ,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                      Padding(
                       padding: const EdgeInsets.only(left: 12.0,right: 10,top: 12,bottom: 12),
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Text(field_heading,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                           const Spacer(flex: 10,),
                           Text(value??"-",style: const TextStyle(color: Colors.pink),textAlign: TextAlign.right,)

                         ],
                       ),
                     ),
                   (divider??false)?const SizedBox():const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 16.0),
                     child: Divider(height: 10,color: Colors.grey,thickness: 0.3,),
                   )

                 ],
               )
             );
  }
}
