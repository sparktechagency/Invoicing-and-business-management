import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/core/constants/constants/assets.dart';
import 'package:invoicing_business_management/routes/app_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppPath.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.splashLogo),
      ),
    );
  }
}