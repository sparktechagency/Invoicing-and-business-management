import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/routes/app_path.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';

// Auth
import 'package:invoicing_business_management/features/auth/presentation/pages/email_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/login_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/otp_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/register_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/set_new_password_screen.dart';

// Onboarding
import 'package:invoicing_business_management/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:invoicing_business_management/routes/dashboard_routes.dart';

import 'auth_routes.dart';
import 'onboarding_routes.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter router = GoRouter(
    initialLocation: AppPath.splash,
    debugLogDiagnostics: true,
    routes: [
      ...OnboardingRoutes.routes,
      ...AuthRoutes.routes,
      ...DashboardRoutes.routes,
    ],
  );

  static CustomTransitionPage<void> slidePage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 280),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        final offsetAnimation = animation.drive(tween);

        final secondaryTween = Tween(
          begin: Offset.zero,
          end: const Offset(-0.3, 0.0),
        ).chain(CurveTween(curve: curve));
        final secondaryOffsetAnimation =
        secondaryAnimation.drive(secondaryTween);

        return SlideTransition(
          position: secondaryOffsetAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
    );
  }
}