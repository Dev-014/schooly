import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/services/auth/auth.dart';
import 'package:provider/provider.dart';
import '../../bloc/generic_bloc.dart';
import '../../modals/user_service/userService.pb.dart';
import '../../widgets/textfield_phonenumber.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  var genericProvider;
  @override
  void initState() {
    // TODO: implement initState
    genericProvider = Provider.of<GenericProvider>(context,listen: false);
    super.initState();
  }
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                              final response = await  AuthServices.verifyOtpForLogIn(mobile_number: genericProvider.phoneNumber, school_id: genericProvider.schoolId,otp:controller.text);
                            if(response.isOtpVerified){
                              genericProvider.addUserProfile(users: response.list) ;
                              genericProvider.setSessionToken(token: response.token);
                              List<User> listOfUsers = [];

                              showModalBottomSheet(context: context, builder: (BuildContext context){
                                listOfUsers = genericProvider.getListOfUser();

                                return Container(

                                  height: 230,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)
                                    )
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 24.0,bottom: 20,right: 24, left: 24),
                                            child: Text("Please select your user profile!",style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                            ),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            height: 120,
                                            child: ListView.builder(
                                              itemCount: listOfUsers.length,
                                              // reverse: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index){
                                                return  Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                                  child: InkWell(
                                                    onTap: (){
                                                      genericProvider.setCurrentUser(index: index,user: listOfUsers[index]);

                                                    },
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 35,
                                                          backgroundColor: Colors.black87,
                                                          child: Icon(Icons.person,color: Colors.white,size:    (listOfUsers[index].type ==Types.TEACHER)? 30: 20,),
                                                          // backgroundImage: AssetImage(listOfUser[index]['avatar']!),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 8.0),
                                                          child: Text(
                                                            (listOfUsers[index].type ==Types.TEACHER)?listOfUsers[index].teacher.details.firstName:listOfUsers[index].student.details.firstName,
                                                            // listOfUsers[index].teacher.details.firstName,
                                                            style: const TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                );
                              });
                              // navigateToRoute(context: context, routePath: UrlConstants.select_user);
                            }
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
        ),
      ),
    );
  }
}
void navigateToRoute({ required BuildContext context,required String routePath }) {
  GoRouter.optionURLReflectsImperativeAPIs =true;
  GoRouter.of(context).push(routePath);

}