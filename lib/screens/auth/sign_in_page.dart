import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';

import 'package:practice/modals/principal.dart';

import 'package:practice/screens/auth/forget_password.dart';

import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:provider/provider.dart';
import '../../modals/student.dart';
import '../../modals/teacher.dart';
import '../../widgets/textfield_phonenumber.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var genericProvider;
  final _focusNode = FocusNode();



  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    genericProvider.userProfile = UserProfile.principal;
    // print(genericProvider.isUserLoggedIn);

    super.initState();
  }
  int? groupValue = 0;
  bool _isChecked1 = true;
  bool _isChecked2 = false;

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    genericProvider = Provider.of<GenericProvider>(context);


    Future<bool> checkDocumentAndLogin(String docId, BuildContext context) async {
      try {
        if(genericProvider.userProfile == UserProfile.student){
        final docRef = FirebaseFirestore.instance.doc("/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/students/$docId");
        final docSnapshot = await docRef.get();

        if (docSnapshot.exists) {
          // Update provider variable
          genericProvider.scholarId = docId;
          print("<<<<<<<<<<object>>>>>>>>>>");
          print(docSnapshot.data());
          genericProvider.loggedInStudent = Student.fromFirestore(docSnapshot);

          genericProvider.setUserLoginToTrue();
          return true;
        } else {
          // Document doesn't exist, handle error or display message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Student does not exist.'),
            ),
          );
          return false;
        }
        }else if(genericProvider.userProfile == UserProfile.teacher){
          final docRef = FirebaseFirestore.instance.doc("/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/teachers/$docId");
          final docSnapshot = await docRef.get();

          if (docSnapshot.exists) {
            // Update provider variable
            genericProvider.empID = docId;
            genericProvider.loggedInTeacher = Teacher.fromFirestore(docSnapshot);

            genericProvider.setUserLoginToTrue();
            return true;
          } else {
            // Document doesn't exist, handle error or display message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Teacher does not exist.'),
              ),
            );
            return false;
          }
        }else if(genericProvider.userProfile == UserProfile.principal) {
            final docRef = FirebaseFirestore.instance.doc("/NewSchool/G0ITybqOBfCa9vownMXU/attendence/y2Yes9Dv5shcWQl9N9r2/principal/$docId");
            final docSnapshot = await docRef.get();
            // Update provider variable
            if (docSnapshot.exists) {
              genericProvider.empID = docId;
              genericProvider.loggedInPrincipal =
                  Principal.fromFirestore(docSnapshot);

              genericProvider.setUserLoginToTrue();
              return true;
            }

           else {
            // Document doesn't exist, handle error or display message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Principal does not exist.'),
              ),
            );
            return false;
          }
        }
        return false;

      } catch (error) {
        // Handle potential errors during Firestore access
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $error'),
          ),
        );
        return false;
      }
    }


    return  Scaffold(
      resizeToAvoidBottomInset: true, // This is the key to keyboard management
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,

              child: Column(
                children: [
                  // Top half of the screen with the logo.
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Icon(
                              Icons.ice_skating,
                              color: Colors.white,
                            ),
                            Text(
                              (AppLocalizations.of(context) == null)
                                  ? "bb"
                                  : AppLocalizations.of(context)!.signIn,
                              style: TextStyle(
                                  fontSize: 40, color: Colors.white),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(
                                        horizontal: 8), child:
                                    Text("Principal",
                                      style: TextStyle(color: Colors.white),),
                                    ),
                                    Radio(
                                        value: 0,
                                        groupValue: groupValue,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value;

                                            genericProvider.setUserProfile(
                                                profile: "Principal");
                                          });
                                        }
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(
                                        horizontal: 8), child:
                                    Text("Teacher",
                                      style: TextStyle(color: Colors.white),),
                                    ), Radio(
                                        value: 1,
                                        groupValue: groupValue,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value;
                                            genericProvider.setUserProfile(
                                                profile: "Teacher");

                                            // genericProvider.userProfile = UserProfile.teacher;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric(
                                        horizontal: 8), child:
                                    Text("Student",
                                      style: TextStyle(color: Colors.white),),
                                    ),
                                    Radio(
                                        value: 2,
                                        groupValue: groupValue,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            groupValue = value;

                                            genericProvider.setUserProfile(
                                                profile: "Student");
                                          });
                                        }
                                    ),
                                  ],
                                ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom half of the screen with the sign in components.
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Phone number text field.
                         TextFieldWithLabelAndCountryCode(
                           controller: controller,
                          labelText:  AppLocalizations.of(context)!.phoneNumber,
                          countryCode: '+91 ',
                        ),
                        // Password text field.
                         TextFieldWithLabelAndCountryCode(
                           controller: controller2,
                          labelText:  AppLocalizations.of(context)!.password,
                        ),
                        // Sign in button.
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: ()async {
                                var check = await checkDocumentAndLogin(controller.text.trim(), context);
                                if(check){
                                // genericProvider.setUserProfile(profile: "Teacher");
                                print(")))00000p00p0p0p0p0p0p0");
                                print(genericProvider.userProfile);
                  
                                setState(() {
                                  // genericProvider
                                  //     .isUserLoggedIn = true;
                                  genericProvider.setUserLoginToTrue();
                                  print(genericProvider.isUserLoggedIn);
                                  print(genericProvider.userProfile);
                                });}
                               // final response = await  HttpRequest().sendOtpRequest(mobileNumber: controller.text, school_id: "XrMZE54KzuJlz6ayc7Gh");
                               // if(response!){
                  
                  
                                // await  Future.delayed(Duration(seconds: 1));
                                // Navigator.pushNamed(context, UrlConstants.verify_otp);
                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerifyOtpPage()));
                  
                               // }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(AppLocalizations.of(context)!.signIn,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        // Forgot password link.
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPasswordPage(),
                                ));
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgotPassword,
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );

  }
}
