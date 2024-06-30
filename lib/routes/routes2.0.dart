import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/routes/url_constants.dart';
import 'package:practice/screens/add_teacher.dart';
import 'package:practice/screens/auth/select_profiles_page.dart';
import 'package:practice/screens/examination/examination_page.dart';
import 'package:practice/screens/fee_detail/student/student_fee_details_page.dart';
import 'package:practice/screens/leave_page/principal/principal_leave_page.dart';
import 'package:practice/screens/homework/student/student_homework.dart';
import 'package:practice/screens/not_clear/classes.dart';
import 'package:practice/screens/not_clear/section.dart';
import 'package:practice/screens/profile_page.dart';
import 'package:practice/screens/auth/sign_in_page.dart';
import 'package:practice/screens/leave_page/student/leave_page.dart';
import 'package:practice/screens/report_card/student/report_card_page.dart';
import 'package:practice/screens/notice_board/student/student_notice_board.dart';
import 'package:practice/screens/study_material/student/study_material.dart';
import 'package:practice/screens/syllabus/student/syllabus.dart';
import 'package:practice/screens/add_student.dart';
import 'package:practice/screens/announcement/teacher/teacher_announcement_page.dart';
import 'package:practice/screens/fee_detail/teacher/teacher_fee_detail.dart';
import 'package:practice/screens/homework/teacher/teacher_homework.dart';
import 'package:practice/screens/leave_page/teacher/teacher_leave_page.dart';
import 'package:practice/screens/notice_board/teacher/teacher_notice_board.dart';

import 'package:practice/screens/generic/upload/upload_syllabus.dart';
import 'package:practice/screens/auth/verify_otp.dart';
import 'package:practice/screens/report_card/teacher/teacher_report_card.dart';
import 'package:practice/screens/syllabus/teacher/teacher_syllabus_page.dart';
import 'package:practice/screens/time_table/teacher/teacher_time_table_page.dart';

import '../screens/academic_calender/academic_calender_page.dart';
import '../screens/attendance/attendance_page.dart';
import '../screens/generic/upload/upload_academic_calender.dart';
import '../screens/generic/upload/upload_time_table.dart';
import '../screens/announcement/student/student_announcement_page.dart';
import '../screens/home_page.dart';
import '../screens/time_table/student/student_time_table_page.dart';
import '../screens/study_material/teacher/teacher_study_material.dart';
import '../screens/generic/upload/upload_announcement.dart';
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
        return const SizedBox.shrink();
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
          child: const SignInPage(),
        ),
        goRoutePathMaker(
          path: UrlConstants.verify_otp,
          child: VerifyOtpPage(),
        ),
        goRoutePathMaker(
          path: UrlConstants.select_user,
          child: SelectProfilePage(),
        ),
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
      child: MenuPage(),
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
      child:  TeacherNoticeBoards(),
    ),
    goRoutePathMaker(
      path: UrlConstants.time_table_form,
      child: const TeacherTimeTablePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_announcement,
      child: const TeacherAnnouncementPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.study_material_form,
      child: const TeacherStudyMaterial(),
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
      child: ViewAttendancePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_feeDetail,
      child: TeacherFeeDetail(),
    ),
    goRoutePathMaker(
      path: UrlConstants.examination_page,
      child: ExaminationPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_syllabus_page,
      child: TeacherSyllabusPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.upload_reportCard,
      child: const TeacherReportCardPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.calender_page,
      child: AcademicCalenderPage(),
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
      child: AddTeacher(),
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
        path: UrlConstants.announcement, child: ViewAnnouncement()),
    goRoutePathMaker(
      path: UrlConstants.view_leave,
      child: TeacherLeavePage(),
    ),
    goRoutePathMaker(
        path: UrlConstants.notice_board, child: StudentNoticeBoard()),
    goRoutePathMaker(
      path: UrlConstants.view_attendance,
      child: ViewAttendancePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.add_classes,
      child: Classes(),
    ),
    goRoutePathMaker(
      path: UrlConstants.add_sections,
      child: AddSectionPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.select_user,
      child: SelectProfilePage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.sign_in,
      child: SignInPage(),
    ),
    goRoutePathMaker(
      path: UrlConstants.add_homework,
      child: HomeWorkForm(),
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
