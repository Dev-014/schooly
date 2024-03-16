import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(onPressed: ()async{
          Navigator.pop(context);

        }, icon: const Icon(Icons.arrow_back,size: 30,)),
        title: const Align(alignment:Alignment.centerLeft,child: Text("Profile",style: TextStyle(fontSize: 18),)),
        backgroundColor: Colors.pink,

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('unschool')
            .doc('class')
            .collection('10')
            .doc('sectionC')
            .collection('students').doc("studentID")
            .snapshots(),

        builder: (BuildContext context,snapshot) {
          var student;
          if(snapshot.hasData){
             student = snapshot.data!.data();

          }
          // print(student!.data());

          return (!snapshot.hasData)?const Center(child: CircularProgressIndicator(),):Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(flex: 1, child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.pink,
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
                      const CircleAvatar(radius: 48, backgroundColor: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0,bottom: 2),
                        child: Text(student["name"]["first_name"],style: const TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w500),),
                      ),
                      Text("Class"+student["class"],style:  TextStyle(fontSize:14,color: Colors.grey.shade100,fontWeight: FontWeight.w200),)

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

                            profileFields(field_heading: "Roll Number",value: student?["roll_no"].toString()),
                            profileFields(field_heading: "Date of Birth",value: student?["dob"]),
                            profileFields(field_heading: "Blood Group",value: student?["blood_grp"]),
                            profileFields(field_heading: "Emergency Contact",value: student?["emergency_contact"]),
                            profileFields(field_heading: "Position in Class",value: student?["class"]),
                            profileFields(field_heading: "Father's Name",value: student?["father_name"]),
                            profileFields(
                                field_heading: "Mother's Name", divider: true,value: student?["mother_name"]),


                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(

                                child: ElevatedButton(

                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(200, 50), backgroundColor: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30)
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text("Ask for Update")),
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                ),
              )
            ],
          );
        }),
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
