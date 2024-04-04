import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';

import 'package:practice/screens/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp( ChangeNotifierProvider(
    create: (context) => GenericProvider(), // Provide an instance of Counter to the widget tree

    child: const MaterialApp(
        locale: Locale("en"),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale("en"),Locale("hi")],
        debugShowCheckedModeBanner: false,
        home: SignInPage()),
  ));
}

