import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/modals/user_service/userService.pb.dart';
import 'package:practice/services/auth/auth.dart';
import 'package:provider/provider.dart';
import '../../bloc/generic_bloc.dart';
import '../../modals/new_teacher.dart';

class SelectProfilePage extends StatefulWidget {
  const SelectProfilePage({super.key});

  @override
  State<SelectProfilePage> createState() => _SelectProfilePageState();
}

class _SelectProfilePageState extends State<SelectProfilePage> {
  // List<Map<String, String>> listOfUser = [
  //   {"name": "Rajiv", "avatar": "assets/avatar_ravi.png"},
  //   {"name": "Deepanshu", "avatar": "assets/avatar_children.png"},
  //   {"name": "Harsh", "avatar": "assets/avatar_children.png"},
  //
  // ];
  List<User> listOfUsers = [];

  var genericProvider;

  @override
  void initState() {
    super.initState();
    genericProvider = Provider.of<GenericProvider>(context, listen: false);
    listOfUsers = genericProvider.getListOfUser();
    // print(listOfUsers.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e8ff),
      // backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 600,
          width: 360,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: const Text(
                  "Your Children Profiles?",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(listOfUsers.length, (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // print(">>>>>....>>>>>>>>>>>>>>>>");
                            // print(listOfUsers);
                            //checkUserType
                            genericProvider.setCurrentUser(index: index,user: listOfUsers[index]);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(Icons.person,color: Colors.grey.shade700,size:    (listOfUsers[index].type ==Types.TEACHER)? 40: 25,),
                            // backgroundImage: AssetImage(listOfUser[index]['avatar']!),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(

                          (listOfUsers[index].type ==Types.TEACHER)?listOfUsers[index].teacher.details.firstName:listOfUsers[index].student.details.firstName,
                          // listOfUsers[index].teacher.details.firstName,
                          style: const TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ))
                ),
              ),
              const SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {
              //     // Add your logic here
              //   },
              //   child: Column(
              //     children: [
              //       const Icon(
              //         Icons.add_circle_outline,
              //         color: Colors.white,
              //         size: 50,
              //       ),
              //       const SizedBox(height: 5),
              //       const Text(
              //         'Add Profile',
              //         style: TextStyle(color: Colors.white, fontSize: 18),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // TextButton(
              //   onPressed: () {
              //     // Add your logic here
              //   },
              //   child: const Text(
              //     'Manage Profiles',
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              // ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../bloc/generic_bloc.dart';
//
// class SelectProfilePage extends StatefulWidget {
//   const SelectProfilePage({super.key});
//
//   @override
//   State<SelectProfilePage> createState() => _SelectProfilePageState();
// }
//
// class _SelectProfilePageState extends State<SelectProfilePage> {
//   List<dynamic> listOfUser = ["User", "User", "User" "User"];
//   var genericProvider;
//   @override
//   void initState() {
//     // TODO: implement initState
//     genericProvider = Provider.of<GenericProvider>(context, listen: false);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Center(
//             child: GridView.count(
//
//               crossAxisCount: 2,
//               children: List.generate(listOfUser.length, (index) {
//                 return InkWell(
//                   onTap: () {
//                     // Add your logic here
//                   },
//                   child: Card(
//                   elevation: 50,
//                   shadowColor: Colors.black,
//                   color: Colors.greenAccent[400],
//                   child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                   const CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.grey,
//                   // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                   'User Name',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   ])))
//                   // child: Card(
//                   //   color: Colors.red,
//                   //   elevation: 4,
//                   //   shape: RoundedRectangleBorder(
//                   //     borderRadius: BorderRadius.circular(16),
//                   //   ),
//                   //   child: Center(
//                   //     child: Text(
//                   //       'User Name ${index + 1}',
//                   //       style: TextStyle(
//                   //         color: Colors.white,
//                   //         fontSize: 20,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
