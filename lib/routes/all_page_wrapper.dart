import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'future_builder_data_checker.dart';


CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

class AllPageWrapper extends StatefulWidget {
  const AllPageWrapper({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Widget screen;

  @override
  State<AllPageWrapper> createState() => _AllPageWrapperState();
}

class _AllPageWrapperState extends State<AllPageWrapper> {
  // late final adminServiceBloc =
  // Provider.of<AdminServiceBloc>(context, listen: false);
  late final Future _future;

  @override
  void initState() {
    super.initState();

    _future = Future.delayed(Duration(seconds: 2),(){
      return true;
    });
  }

  // Future getUser() async {
  //   return adminServiceBloc.getSelectedUserId().isEmpty
  //       ? adminServiceBloc.getAllUsers(
  //     GetAllUsersRequest(
  //       pageToken: Int64(1),
  //     ),
  //   )
  //       : Future.value(1);
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        final futureResponse =
        futureBuilderDataCheck(snapshot: snapshot, context: context);
        if (futureResponse != null) {
          return futureResponse;
        }

        return  widget.screen;

        //   SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     constraints: const BoxConstraints(
        //       minWidth: 1000,
        //     ),
        //     child: Row(
        //       children: [
        //
        //         Expanded(
        //           child: Column(
        //             children: [
        //
        //               Expanded(
        //                 flex: 5,
        //                 child: widget.screen,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
