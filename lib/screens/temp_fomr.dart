
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

import '../modals/user_service/userService.pb.dart';
import '../utils/validators.dart';
import '../widgets/loader_button.dart';
import '../widgets/showSnackBar.dart';

class TempForm extends StatefulWidget {
  const TempForm({super.key});

  @override
  State<TempForm> createState() => _TempFormState();
}

class _TempFormState extends State<TempForm> {
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();
  TextEditingController _textController3 = TextEditingController();
  TextEditingController _textController4 = TextEditingController();
  TextEditingController _textController5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value)=>Validator.validateScholarId.call(value),
          ),
          TextFormField(
          validator: (value)=>Validator.validateScholarId.call(value)),
          TextFormField(
              validator: (value)=>Validator.validateScholarId.call(value),
          ),
          TextFormField(
            validator: (value)=>Validator.validateScholarId.call(value),

          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: LoaderElevatedButton(
                onPressed: () async {
                  print("mlmlmlmlmlmlmlml");
                    if (_formKey.currentState != null &&_formKey.currentState!.validate()) {
                      print(",.,.,..,.,...");
                      User user = User(
                        student: Student(
                          details: Details(
                            id: _textController2.text,
                            firstName: _textController1.text,
                            lastName: _textController4.text,
                            phoneNumber: _textController5.text,
                          ),
                          sectionId: "C",
                          classId: "7",
                          rollNumber: Int64(
                            int.parse("9"),
                          ),
                        ),
                        type: Types.STUDENT,
                      );
                      // await AddService.addUser(
                      //     token: genericProvider.sessionToken,
                      //     context: context,
                      //     user: user);

                    }
      else{
      showSnackBar(text: "Error currrent state context is null", context: context);
      }
                },

                buttonText: "Submit",
              ),
            ),
          ),



        ],
      ),
    );
  }
}
