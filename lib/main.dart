import 'package:flutter/material.dart';
import 'package:practice/bloc/generic_bloc.dart';
import 'package:practice/screens/dashboard.dart';
import 'package:practice/screens/notice_board_page.dart';
import 'package:practice/screens/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice/screens/students_ui_2.0/leave_page.dart';
import 'package:practice/screens/students_ui_2.0/student_notice_board.dart';
import 'package:practice/screens/students_ui_2.0/view_attendence_page.dart';
import 'package:practice/screens/teachers/class_notice_board.dart';
import 'package:practice/screens/teachers/homework.dart';
import 'package:practice/screens/teachers/teacher_notice_board.dart';
import 'package:practice/screens/teachers/teachers_leave_page.dart';
import 'package:practice/screens/tempp.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) =>
          GenericProvider(), // Provide an instance of Counter to the widget tree

      child: const MaterialApp(
          locale: Locale("en"),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale("en"), Locale("hi")],
          debugShowCheckedModeBanner: false,
          home: TeacherNoticeBoard())
      // home: AttendanceCalculator(
      //   studentId: 'scholar_2',
      // )),
      ));
}
