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

  late final Future _future;

  @override
  void initState() {
    super.initState();

    _future = Future.delayed(Duration(seconds: 0),(){
      return true;
    });
  }


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

      },
    );
  }
}
