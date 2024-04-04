import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/bloc/http_request.dart';
import 'package:practice/l10n/l10n.dart';
import 'package:practice/screens/forget_password.dart';
import 'package:practice/screens/students_ui_2.0/announcements.dart';
import 'package:practice/screens/students_ui_2.0/dashboard.dart';
import 'package:practice/screens/teachers/teacher_menu_page.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:practice/screens/verify_otp.dart';
import 'package:provider/provider.dart';
import '../common_widgets/textfield_phonenumber.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();


    return  Scaffold(
        body: Column(
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
                child:  Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.ice_skating,
                        color: Colors.white,
                      ),
                      Text(
                          ( AppLocalizations.of(context)==null)?"bb":AppLocalizations.of(context)!.signIn,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Bottom half of the screen with the sign in components.
            Expanded(
              flex: 2,
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
                            genericProvider.setUserProfile(profile: "Student");
                            print(genericProvider.userProfile);
                           // final response = await  HttpRequest().sendOtpRequest(mobileNumber: controller.text, school_id: "XrMZE54KzuJlz6ayc7Gh");
                           // if(response!){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerifyOtpPage()));

                           // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(AppLocalizations.of(context)!.signIn),
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
          ],
        ),
      );

  }
}
