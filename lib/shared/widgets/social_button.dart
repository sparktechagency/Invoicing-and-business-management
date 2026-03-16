

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  const SocialButton({super.key, required this.assetPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.luckyGrey200,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              assetPath,
              width: 32.w,
              height: 32.h,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.login,
                size: 24.sp,
                color: AppColors.luckyGrey400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}