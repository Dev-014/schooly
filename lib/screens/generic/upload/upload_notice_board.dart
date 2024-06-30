import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:practice/modals/academic_service/academicService.pb.dart';
import 'package:practice/modals/academic_service/academicService.pbenum.dart';
import 'package:practice/services/add_service/add_service.dart';
import 'package:practice/widgets/newTextField.dart';
import 'package:provider/provider.dart';


import '../../../bloc/generic_bloc.dart';
import '../../../services/firebase_storage.dart';
import '../../../widgets/loader_button.dart';
import '../../../widgets/form_textfield.dart';
import '../../../widgets/loader_icon_text_button.dart';
import '../../../widgets/new_drop_down.dart';

class UploadNoticeBoard extends StatefulWidget {
  const UploadNoticeBoard({super.key});

  @override
  State<UploadNoticeBoard> createState() => _UploadNoticeBoardState();
}

class _UploadNoticeBoardState extends State<UploadNoticeBoard> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  List<CustDropdownMenuItem> classDropDownList = [];
  List<String> classs = ["1","2","3","4","5","6","7","8","9","10","11","12",];
  String? clazz;
  Uint8List? result;

  var groupValue = 0;
  bool disableClassDropDown = false;
  NoticeType selectedType = NoticeType.SCHOOL;
  var genericProvider;
  @override
  void initState() {
    genericProvider = Provider.of<GenericProvider>(context,listen: false);

    for( var classe in classs){
      classDropDownList.add(CustDropdownMenuItem(value: classe, child: Container(height:50 ,alignment: Alignment.centerLeft,decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: Colors.grey.withOpacity(.0)),child: Text(classe))));
    }
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(
                            horizontal: 8), child:
                        Text("All",
                          // style: TextStyle(color: Colors.white),
                        ),
                        ),
                        Radio(
                          value: 0,
                          groupValue: groupValue,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                              disableClassDropDown =false;
                              selectedType = NoticeType.SCHOOL;


                            });
                          },
                        )],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(
                            horizontal: 8), child:
                        Text("Class",
                          // style: TextStyle(color: Colors.white),
                        ),
                        ),
                        Radio(
                            value: 1,
                            groupValue: groupValue,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value!;
                                disableClassDropDown =true;
                                selectedType = NoticeType.CLASS;


                              }
                              );
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if(disableClassDropDown)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
                  child: CustDropDown(items: classDropDownList, onChanged: (value){
                    setState(() {
                      clazz = value!;


                    });
                  },hintText: "Select Class",),
                ),


              NewTempFormField(labelText:"Title",hintText: "Title", iconData: Icons.group,textEditingController: textEditingController1),
              NewTempFormField(labelText: "Content",hintText: "Content", iconData: Icons.book,textEditingController: textEditingController3),
              LoaderIconTextButton(text: "Attach Time Table ", icon: Icons.attach_file_outlined, onPressed: ()async{
                 result =await FirebaseStorageService.uploadFiles();

              }),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: LoaderElevatedButton(
                    buttonText: "Submit",
                    onPressed: ()async{
                      AddService.addNotice(token: genericProvider.sessionToken,notice: Notice(title: textEditingController1.text,content: textEditingController3.text, type: selectedType ),context: context,list: result);
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
