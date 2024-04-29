import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/routes/future_builder_data_checker.dart';
import 'package:practice/routes/routes.dart';
import 'package:practice/routes/routes2.0.dart';

import 'package:practice/screens/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() async{
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp( ChangeNotifierProvider(
    create: (context) => GenericProvider(), // Provide an instance of Counter to the widget tree

    child:  MaterialWrapper(),));
}


class MaterialWrapper extends StatelessWidget {
  const MaterialWrapper({super.key});
  static RouteHandler? router = RouteHandler();

  @override
  Widget build(BuildContext context) {

    Future<bool?> getIsUserLoggedIn() async {
      // await Future.delayed(Duration(seconds: 2));
      // return false;
      return Provider.of<GenericProvider>(context).isUserLoggedIn;
    }

    return FutureBuilder(
        future: getIsUserLoggedIn(),
    builder: (context, snapshot) {
          print("snapshot.data");
          print(snapshot.data);
      final futureResponse =
      futureBuilderDataCheck(snapshot: snapshot, context: context);
      if (futureResponse != null) {
        return futureResponse;
      }
      GenericProvider genericProvider =
      Provider.of<GenericProvider>(context);

      // configLoading(color: themeServiceBloc.selectedColor);
      return MaterialApp.router(

        builder: EasyLoading.init(),

        locale: Locale("hi"),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("en"), Locale("hi")],
        debugShowCheckedModeBanner: false,
        // home: SignInPage(),
        routerConfig: snapshot.data!
            ? router?.getLoggedInGoRouter
            : router?.getGoRouter,
        // onGenerateRoute: (settings) {
        //   return Routes.getRoute(settings.name!);
        // },),

      );
    });
  }
}

