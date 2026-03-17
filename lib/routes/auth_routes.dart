




import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/email_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/login_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/otp_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/register_screen.dart';
import 'package:invoicing_business_management/features/auth/presentation/pages/set_new_password_screen.dart';
import 'package:invoicing_business_management/routes/app_path.dart';
import 'package:invoicing_business_management/routes/app_routes.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';

class AuthRoutes {
  AuthRoutes._();


  static final List<RouteBase> routes = [
    GoRoute(
      path: AppPath.login,
      name: AppRoutesName.login,
      pageBuilder: (context, state) => AppRoutes.slidePage(
        context: context,
        state: state,
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AppPath.register,
      name: AppRoutesName.register,
      pageBuilder: (context, state) => AppRoutes.slidePage(
        context: context,
        state: state,
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: AppPath.otpPage,
      name: AppRoutesName.otpPage,
      pageBuilder: (context, state) => AppRoutes.slidePage(
        context: context,
        state: state,
        child: const OtpScreen(),
      ),
    ),
    GoRoute(
      path: AppPath.setNewPassword,
      name: AppRoutesName.setNewPassword,
      pageBuilder: (context, state) => AppRoutes.slidePage(
        context: context,
        state: state,
        child: const SetNewPasswordScreen(),
      ),
    ),
    GoRoute(
      path: AppPath.emailPage,
      name: AppRoutesName.emailPage,
      pageBuilder: (context, state) => AppRoutes.slidePage(
        context: context,
        state: state,
        child: EmailScreen(),
      ),
    ),
  ];
}
