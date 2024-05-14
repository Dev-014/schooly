
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/screens/calender_page.dart';
import 'package:practice/screens/examination_page.dart';
import 'package:practice/screens/fee_details_page.dart';
import 'package:practice/screens/principal/principal_leave_page.dart';
import 'package:practice/screens/students_ui_2.0/homework_page.dart';
import 'package:practice/screens/profile_page.dart';
import 'package:practice/screens/sign_in_page.dart';
import 'package:practice/screens/students_ui_2.0/announcements.dart';
import 'package:practice/screens/students_ui_2.0/dashboard.dart';
import 'package:practice/screens/students_ui_2.0/leave_page.dart';
import 'package:practice/screens/students_ui_2.0/report_card_page.dart';
import 'package:practice/screens/students_ui_2.0/student_notice_board.dart';
import 'package:practice/screens/students_ui_2.0/study_material.dart';
import 'package:practice/screens/students_ui_2.0/syllabus.dart';
import 'package:practice/screens/students_ui_2.0/time_table.dart';
import 'package:practice/screens/students_ui_2.0/view_attendance_page.dart';
import 'package:practice/screens/teachers/add_student.dart';
import 'package:practice/screens/teachers/homework.dart';
import 'package:practice/screens/teachers/teacher_leave_page.dart';
import 'package:practice/screens/teachers/teacher_notice_board.dart';
import 'package:practice/screens/teachers/upload_fee_details.dart';
import 'package:practice/screens/teachers/upload_report_card.dart';
import 'package:practice/screens/teachers/upload_study_material.dart';
import 'package:practice/screens/teachers/upload_syllabus.dart';
import 'package:practice/screens/verify_otp.dart';

import '../screens/principal/upload_academic_calender.dart';
import '../screens/students_ui_2.0/time_table_form.dart';
import '../screens/teachers/upload_announcement.dart';
import 'all_page_wrapper.dart';

class RouteHandler {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter? _loggedInRouter;
  GoRouter? _router;

  static final RouteHandler _routeHandler = RouteHandler._internal();

  factory RouteHandler() {
    return _routeHandler;
  }

  RouteHandler._internal() {
    _loggedInRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: UrlConstants.dashboard,
      // redirect: (context, goRouter) async {
      //   if (goRouter.location != UrlConstants.login &&
      //       (!(AuthServiceBloc().getIsUserLoggedIn() ?? false))) {
      //     return UrlConstants.login;
      //   }
      //
      //   if (goRouter.location == UrlConstants.login &&
      //       (AuthServiceBloc().getIsUserLoggedIn() ?? false)) {
      //     return UrlConstants.dashboard;
      //   }
      //
      //   return null;
      // },
      errorBuilder: (BuildContext context, GoRouterState state) {
        Future.delayed(Duration.zero, () {
          context.go(UrlConstants.dashboard);
        });
        return SizedBox.shrink();
      },
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: AllPageWrapper(
                screen: child,
              ),
            );
          },
          routes: _getRouteList(),
        ),
      ],
    );
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: UrlConstants.sign_in,
      errorBuilder: (BuildContext context, GoRouterState state) {
        Future.delayed(Duration.zero, () {
          context.go(UrlConstants.sign_in);
        });
        return SizedBox.shrink();
      },
      routes: <RouteBase>[
        goRoutePathMaker(
          path: UrlConstants.sign_in,
          child: SignInPage(),
        ),
        goRoutePathMaker(path: UrlConstants.verify_otp, child: VerifyOtpPage())
      ],
    );
  }

  reInitializeRouter() {
    _loggedInRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: UrlConstants.dashboard,
      // redirect: (context, goRouter) async {
      //   if (goRouter.location != UrlConstants.login &&
      //       (!(AuthServiceBloc().getIsUserLoggedIn() ?? false))) {
      //     return UrlConstants.login;
      //   }
      //
      //   if (goRouter.location == UrlConstants.login &&
      //       (AuthServiceBloc().getIsUserLoggedIn() ?? false)) {
      //     return UrlConstants.dashboard;
      //   }
      //
      //   return null;
      // },
      errorBuilder: (BuildContext context, GoRouterState state) {
        Future.delayed(Duration.zero, () {
          context.go(UrlConstants.dashboard);
        });
        return SizedBox.shrink();
      },
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: AllPageWrapper(
                screen: child,
              ),
            );
          },
          routes: _getRouteList(),
        ),
      ],
    );
  }

  GoRouter get getGoRouter {
    return _router!;
  }

  GoRouter get getLoggedInGoRouter {
    return _loggedInRouter!;
  }
}

List<RouteBase> _getRouteList() {
  final List<RouteBase> routeList = [
    goRoutePathMaker(
      path: UrlConstants.profile,
      child: ProfilePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.dashboard,
      child:  MenuPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.verify_otp,
      child: VerifyOtpPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.add_student,
      child: AddStudents(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_academic_calender,
      child: UploadAcademicCalender(),
    ),

    goRoutePathMaker(
      path: UrlConstants.student_notice_board,
      child: StudentNoticeBoard(),
    ),
    goRoutePathMaker(
      path: UrlConstants.teacher_notice_board,
      child: TeacherNoticeBoard(),
    ),
    goRoutePathMaker(
      path: UrlConstants.time_table_form,
      child: TimetableForm(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_announcement,
      child: UploadAnnouncement(),
    ),
    goRoutePathMaker(
      path: UrlConstants.study_material_form,
      child: StudyMaterialForm(),
    ),
    goRoutePathMaker(
      path: UrlConstants.principal_leave_page,
      child: PrincipalLeavePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.profile,
      child: ProfilePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.attendance_calculator,
      child: AttendanceCalculator(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_feeDetail,
      child: UploadFeeDetail(),
    ),
    goRoutePathMaker(
      path: UrlConstants.examination_page,
      child: ExaminationPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_syllabus_page,
      child: UploadSyllabusPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_reportCard,
      child: UploadReportCard(),
    ),
    goRoutePathMaker(
      path: UrlConstants.calender_page,
      child: CalenderPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.teacher_leave_page,
      child: TeacherLeavePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.report_card,
      child: ReportCardPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.syllabus_page,
      child: SyllabusPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.time_table,
      child: TimeTable(),
    ),
    goRoutePathMaker(
      path: UrlConstants.leave_page,
      child: LeavePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.fee_details,
      child: FeeDetailsPage(),
    ),



    goRoutePathMaker(
      path: UrlConstants.add_teacher,
      child: AddStudents(),
    ),
    goRoutePathMaker(
      path: UrlConstants.home_work,
      child: HomeWorkPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.study_material,
      child: StudyMaterial(section: "c", clazz: '10'),
    ),
    goRoutePathMaker(
      path: UrlConstants.announcement,
      child: Announcement()
    ),
    goRoutePathMaker(
      path: UrlConstants.view_leave,
      child: TeacherLeavePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.notice_board,
      child: StudentNoticeBoard()
    ),
    goRoutePathMaker(
      path: UrlConstants.view_attendance,
      child: AttendanceCalculator(),
    ),
    goRoutePathMaker(
      path: UrlConstants.sign_in,
      child: SignInPage()
    ),
    goRoutePathMaker(
        path: UrlConstants.add_homework,
        child: HomeWorkForm()
    ),
    // goRoutePathMaker(
    //   path: UrlConstants.sshConnect,
    //   child: SSHConnectTerminal(),
    // ),
  ];

  return routeList;
}

GoRoute goRoutePathMaker({required String path, required Widget child}) {
  return GoRoute(
    path: path,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: child,
      );
    },
  );
}
