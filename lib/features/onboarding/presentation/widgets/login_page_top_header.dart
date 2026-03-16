
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicing_business_management/shared/styles/app_text_styles.dart';

import '../../../../shared/styles/app_colors.dart';

class TopHeader extends StatefulWidget {
  final List<Map<String, String>> onboardingData;

  const TopHeader({required this.onboardingData});

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
          clipper: WaveClipper(),
          child: Container(
            height: 220.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8EFFF),
                  Color(0xFFE8EFFF),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.onboardingData.length, (i) {
            final bool active = i == _currentPage;
            return GestureDetector(
              onTap: () => _pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active ? AppColors.brand700 : AppColors.luckyGrey300,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 14.h),
        SizedBox(
          height: 56.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: widget.onboardingData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    Text(
                      widget.onboardingData[index]['title']!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitleSemiBold18(),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.onboardingData[index]['subtitle']!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        color: AppColors.luckyGrey500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => false;
}