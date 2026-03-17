

import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/features/dashboard/presentation/page/dashboard_screen.dart';

import 'app_path.dart';
import 'app_routes_name.dart';

class DashboardRoutes {
  DashboardRoutes._();
  static final List<RouteBase> routes = [
    GoRoute(
      path: AppPath.dashboard,
      name: AppRoutesName.dashboard,
      builder: (context, state) => DashboardScreen(),
    ),
  ];
}