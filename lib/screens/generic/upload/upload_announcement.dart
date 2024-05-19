import 'package:flutter/material.dart';
import 'package:practice/services/other/announcement/announcement_service.dart';


import '../../../widgets/loader_button.dart';
import '../../../widgets/form_textfield.dart';

class UploadAnnouncement extends StatefulWidget {
  const UploadAnnouncement({super.key});

  @override
  State<UploadAnnouncement> createState() => _UploadAnnouncementState();
}

class _UploadAnnouncementState extends State<UploadAnnouncement> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: SizedBox(
       height: MediaQuery.of(context).size.height*.9,
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(
               height: 10,
             ),


             formTextFields(hintText: "Title", iconData: Icons.group,textEditingController: textEditingController1),


             formTextFields
               (
                 hintText: "Category", iconData: Icons.hotel_class_outlined,textEditingController: textEditingController2),
             formTextFields(hintText: "Description", iconData: Icons.book,textEditingController: textEditingController3),

             Padding(
               padding:
               const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
               child: LoaderElevatedButton(
                 buttonText: "Submit",
                 onPressed: ()async{

                   var a = AnnouncementService.uploadAnnouncement(textEditingController3.text, textEditingController1.text, textEditingController2.text);

                 },
               ),

             )
           ],
         ),
       ),
     ),
   );

  }
}
