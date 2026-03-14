

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoicing_business_management/routes/app_routes.dart';

class InvoicingBusinessManagement extends StatelessWidget {
  const InvoicingBusinessManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
