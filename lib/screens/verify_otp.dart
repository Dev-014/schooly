import 'package:flutter/material.dart';
import 'package:practice/bloc/http_request.dart';
import 'package:practice/screens/dashboard.dart';
import 'package:practice/screens/students_ui_2.0/dashBoard2.dart';
import 'package:practice/screens/students_ui_2.0/dashboard.dart';

import '../common_widgets/otp_textfield.dart';
import '../common_widgets/textfield_phonenumber.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
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
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ice_skating,
                      color: Colors.white,
                    ),
                    Text(
                      "Verify Otp",
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
                    labelText: 'Enter Otp',
                  ),
                  // Expanded(
                  //   flex: 7,
                  //   child: SizedBox(
                  //     width: 400,
                  //     child: OTPInputField(
                  //       controller: controller,
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Send Again',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),

                  // Sign in button.
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () async {
                          // final response = await  HttpRequest().verifyOtpForLogIn(mobile_number: '9826135966', school_id: 'XrMZE54KzuJlz6ayc7Gh',otp:controller.text);
                        // if(response!){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MenuPage();
                          }));
                        // }
                          },
                        child: Text('Verify'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Forgot password link.
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
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
