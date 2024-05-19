import 'package:flutter/material.dart';
import 'package:practice/screens/auth/sign_in_page.dart';
import 'package:practice/screens/auth/verify_otp.dart';

import '../screens/home_page.dart';

class Routes {
  static final Map<String, PageRouteBuilder> _routes = {
    '/': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInPage(),

      transitionDuration: Duration(milliseconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/verify_otp': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/profile': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/report_card': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/notice_board': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/study_material': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/home_work': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/academic_calender': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/take_attendance': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/view_attendance': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/fee_details': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/announcement': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/forgot_password': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/add_student': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/add_teacher': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/apply_leave': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/view_leave': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpPage(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    '/dashboard': PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MenuPage(),
      transitionDuration: Duration(milliseconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),


  };

  static PageRouteBuilder getRoute(String routeName) {
    return _routes[routeName]!;
  }
}