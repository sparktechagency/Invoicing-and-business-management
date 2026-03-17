


import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:invoicing_business_management/routes/app_path.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';

class OnboardingRoutes {
  OnboardingRoutes._();

  static final List<RouteBase> routes = [
    GoRoute(
      path: AppPath.splash,
      name: AppRoutesName.splash,
      builder: (context, state) => const SplashScreen(),
    ),
  ];
}