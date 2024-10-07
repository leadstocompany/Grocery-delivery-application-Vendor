import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vendor_app/src/core/utiils_lib/globle_variable.dart';
import 'package:vendor_app/src/presentation/auth_screen/login_screen.dart';
import 'package:vendor_app/src/presentation/auth_screen/sign_up_screen.dart';
import 'package:vendor_app/src/presentation/bussiness/approval_screen.dart';
import 'package:vendor_app/src/presentation/bussiness/create_store.dart';
import 'package:vendor_app/src/presentation/bussiness/setup_bussiness.dart';
import 'package:vendor_app/src/presentation/bussiness/successfully_created.dart';
import 'package:vendor_app/src/presentation/customersorder/customers_order.dart';
import 'package:vendor_app/src/presentation/dashboard/dashboard_screen.dart';
import 'package:vendor_app/src/presentation/onboarding/onboarding_screen.dart';
import 'package:vendor_app/src/presentation/select_account.dart';
import 'package:vendor_app/src/presentation/splash_screen.dart';
import 'package:vendor_app/src/presentation/terms&conditions/terms_conditions.dart';

/// Route names as constants
class MyRoutes {
  static GoRouter router = GoRouter(
    navigatorKey: GlobalVariable.globalScaffoldKey,
    initialLocation: SPLASH,
    routes: [
      animatedGoRoute(
        path: SPLASH,
        name: SPLASH,
        pageBuilder: (context, state) => const SplashScreen(),
      ),
      animatedGoRoute(
        path: ONBOARDING,
        name: ONBOARDING,
        pageBuilder: (context, state) => const OnboardingScreen(),
      ),
      animatedGoRoute(
        path: LOGIN,
        name: LOGIN,
        pageBuilder: (context, state) => const LoginHostScreen(),
      ),
      animatedGoRoute(
        path: SELECTACCOUNT,
        name: SELECTACCOUNT,
        pageBuilder: (context, state) => const SelectAccount(),
      ),
           animatedGoRoute(
        path: TERMANDCONDITIONS,
        name: TERMANDCONDITIONS,
        pageBuilder: (context, state) => const TermsAndConditionsScreen(),
      ),
      animatedGoRoute(
        path: SETUPBUSSINESS,
        name: SETUPBUSSINESS,
        pageBuilder: (context, state) => const SetupBussiness(),
      ),
       animatedGoRoute(
        path: CREATESTORE,
        name: CREATESTORE,
        pageBuilder: (context, state) => const CreateStore(),
      ),

animatedGoRoute(
        path: SUBMITSCREEN,
        name: SUBMITSCREEN,
        pageBuilder: (context, state) => const PinCreated(),
      ),
      animatedGoRoute(
        path: APPROVEDSTATUS,
        name: APPROVEDSTATUS,
        pageBuilder: (context, state) => const ApprovalScreen(),
      ),

         animatedGoRoute(
        path: SIGNUP,
        name: SIGNUP,
        pageBuilder: (context, state) =>  SignUpScreen(),
      ),
      animatedGoRoute(
        path: DASHBOARDSCREEN,
        name: DASHBOARDSCREEN,
        
        pageBuilder: (context, state) => DashboardScree(),
      ),

        animatedGoRoute(
        path: CUSTOMERORDER,
        name: CUSTOMERORDER,
        pageBuilder: (context, state) {
          // Extract data from `state.extra`
      final Map<String, dynamic> orderDetails =
              state.extra as Map<String, dynamic>;


          return CustomerOrder(
            orderDetails:
                orderDetails, // Pass the data to the destination widget
          );
        },
      ),

      
      
      
    ],
  );

  /// Route constants
  static const SPLASH = "/";
  static const HOME = "/home";
  static const SELECTACCOUNT = "/selectAccount";
  static const DASHBOARD = "/dashboard";

  static const BOTTOM_NAV = "/home";
  static const LOGIN = "/login";
  static const ONBOARDING = "/onboarding";
  static const TERMANDCONDITIONS = "/termsandcondition";
  static const SETUPBUSSINESS = "/setupbussiness";
  static const CREATESTORE = "/createStore";
  static const SUBMITSCREEN = "/submitscreen";
  static const APPROVEDSTATUS = "/approvedstatus";
  static const SIGNUP = "/signup";
  static const DASHBOARDSCREEN = "/dashboardscreen";
  static const CUSTOMERORDER = "/customerorder";


  





}

GoRoute animatedGoRoute({
  required String path,
  required String name,
  ExitCallback? onExitPage,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    name: name,
    onExit: onExitPage,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 400),
      child: pageBuilder(context, state),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.5, 0), end: Offset.zero).chain(
                  CurveTween(curve: Curves.bounceIn),
                ),
              ),
              child: child,
            );
          },
        );
}
