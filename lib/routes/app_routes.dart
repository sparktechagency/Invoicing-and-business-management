import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/login_screen.dart';
import 'package:invoicing_business_management/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:invoicing_business_management/routes/app_pages.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter router = GoRouter(
    initialLocation: AppPages.splash,
    debugLogDiagnostics: true,
    routes: _routes,
  );

  static final List<RouteBase> _routes = [
    GoRoute(
        path: AppPages.splash,
        name: 'Splash',
        builder: (context, state) => const SplashScreen()
    ),

    GoRoute(
        path: AppPages.login,
        name: 'Login',
        builder: (context, state) => LoginScreen()
    ),
  ];
}
