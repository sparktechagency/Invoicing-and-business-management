import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicing_business_management/shared/styles/app_text_styles.dart';
import '../../../../shared/styles/app_colors.dart';

class TopHeader extends StatefulWidget {
  final List<Map<String, String>> onboardingData;

  const TopHeader({super.key, required this.onboardingData});

  @override
  State<TopHeader> createState() => TopHeaderState();
}

class TopHeaderState extends State<TopHeader> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;
      final next = (_currentPage + 1) % widget.onboardingData.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
      return true;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: _BottomArcClipper(),
          child: Container(
            height: 150.h,
            width: double.infinity,
            color: const Color(0xFFE8EFFF),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.onboardingData.length, (i) {
            final bool active = i == _currentPage;
            return GestureDetector(
              onTap: () => _pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active ? AppColors.brand700 : AppColors.luckyGrey300,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 52.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: widget.onboardingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    Text(
                      widget.onboardingData[index]['title']!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitleRegular20(),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.onboardingData[index]['subtitle']!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitleRegular16(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 60,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_BottomArcClipper oldClipper) => false;
}