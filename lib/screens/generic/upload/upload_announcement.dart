  import 'package:flutter/material.dart';
  import 'package:practice/modals/academic_service/academicService.pb.dart';
  import 'package:practice/services/add_service/add_service.dart';
  import 'package:practice/services/other/announcement/announcement_service.dart';
import 'package:practice/widgets/newTextField.dart';
  import 'package:provider/provider.dart';


  import '../../../bloc/generic_bloc.dart';
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
    var genericProvider;
    @override
    void initState() {
      // TODO: implement initState
      genericProvider = Provider.of<GenericProvider>(context,listen: false);
      super.initState();
    }
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


               NewTempFormField(labelText: "Title",hintText: "Title", iconData: Icons.group,textEditingController: textEditingController1),


               NewTempFormField
                 (
                   labelText: "Category",hintText: "Category", iconData: Icons.hotel_class_outlined,textEditingController: textEditingController2),
               NewTempFormField(labelText: "Description",hintText: "Description", iconData: Icons.book,textEditingController: textEditingController3),

               Padding(
                 padding:
                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                 child: LoaderElevatedButton(
                   buttonText: "Submit",
                   onPressed: ()async{
                      AddService.addAnnouncement(token: genericProvider.sessionToken,announcement: Announcement(title: textEditingController1.text,description: textEditingController3.text,category: Category.Examination ),context: context);
                     // var a = AnnouncementService.uploadAnnouncement(description:textEditingController3.text, title:textEditingController1.text, category:textEditingController2.text);

                   },
    )

               )
             ],
           ),
         ),
       ),
     );

    }
  }
