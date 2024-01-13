import 'package:flutter/material.dart';
import 'package:practice/screens/dashboard.dart';
import 'package:practice/screens/menu_page.dart';
import 'package:practice/screens/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice/screens/students_ui_2.0/leave_page.dart';
import 'package:practice/screens/teachers/class_notice_board.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp( const MaterialApp(
      locale: Locale("en"),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"),Locale("hi")],
      debugShowCheckedModeBanner: false,
      home: SignInPage()));
}

