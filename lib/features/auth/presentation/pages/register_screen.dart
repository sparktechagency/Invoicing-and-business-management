import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';
import 'package:invoicing_business_management/shared/widgets/app_bar_back_button.dart';
import '../../../../core/constants/constants/assets.dart';
import '../../../../shared/styles/app_colors.dart';
import '../../../../shared/styles/app_text_styles.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/primary_input_filed.dart';
import '../../../../shared/widgets/social_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedCountryCode = '+880';
  String _selectedCountryFlag = '🇧🇩';

  final List<Map<String, String>> _countryCodes = [
    {'flag': '🇧🇩', 'code': '+880', 'name': 'Bangladesh'},
    {'flag': '🇺🇸', 'code': '+1', 'name': 'United States'},
    {'flag': '🇬🇧', 'code': '+44', 'name': 'United Kingdom'},
    {'flag': '🇮🇳', 'code': '+91', 'name': 'India'},
    {'flag': '🇦🇺', 'code': '+61', 'name': 'Australia'},
    {'flag': '🇨🇦', 'code': '+1', 'name': 'Canada'},
    {'flag': '🇦🇪', 'code': '+971', 'name': 'UAE'},
    {'flag': '🇸🇦', 'code': '+966', 'name': 'Saudi Arabia'},
    {'flag': '🇲🇾', 'code': '+60', 'name': 'Malaysia'},
    {'flag': '🇸🇬', 'code': '+65', 'name': 'Singapore'},
    {'flag': '🇵🇰', 'code': '+92', 'name': 'Pakistan'},
    {'flag': '🇳🇬', 'code': '+234', 'name': 'Nigeria'},
    {'flag': '🇿🇦', 'code': '+27', 'name': 'South Africa'},
    {'flag': '🇩🇪', 'code': '+49', 'name': 'Germany'},
    {'flag': '🇫🇷', 'code': '+33', 'name': 'France'},
    {'flag': '🇯🇵', 'code': '+81', 'name': 'Japan'},
    {'flag': '🇰🇷', 'code': '+82', 'name': 'South Korea'},
    {'flag': '🇧🇷', 'code': '+55', 'name': 'Brazil'},
    {'flag': '🇲🇽', 'code': '+52', 'name': 'Mexico'},
    {'flag': '🇮🇩', 'code': '+62', 'name': 'Indonesia'},
    {'flag': '🇵🇭', 'code': '+63', 'name': 'Philippines'},
    {'flag': '🇹🇷', 'code': '+90', 'name': 'Turkey'},
    {'flag': '🇪🇬', 'code': '+20', 'name': 'Egypt'},
    {'flag': '🇰🇪', 'code': '+254', 'name': 'Kenya'},
    {'flag': '🇬🇭', 'code': '+233', 'name': 'Ghana'},
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showCountryPicker() {
    final TextEditingController searchController = TextEditingController();
    List<Map<String, String>> filteredList = List.from(_countryCodes);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.6,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppColors.luckyGrey300,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Select Country',
                        style: AppTextStyles.subtitleRegular20(
                          color: AppColors.luckyGrey900,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setModalState(() {
                            filteredList = _countryCodes
                                .where((c) =>
                            c['name']!
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                                c['code']!.contains(value))
                                .toList();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search country...',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.luckyGrey400,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.luckyGrey400,
                            size: 20.sp,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          filled: true,
                          fillColor: AppColors.luckyGrey100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Expanded(
                        child: filteredList.isEmpty
                            ? Center(
                          child: Text(
                            'No country found',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.luckyGrey400,
                            ),
                          ),
                        )
                            : ListView.separated(
                          controller: scrollController,
                          itemCount: filteredList.length,
                          separatorBuilder: (_, __) => Divider(
                            height: 1,
                            color: AppColors.luckyGrey200,
                          ),
                          itemBuilder: (context, index) {
                            final country = filteredList[index];
                            final isSelected =
                                country['code'] == _selectedCountryCode &&
                                    country['flag'] == _selectedCountryFlag;
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.h,
                              ),
                              leading: Text(
                                country['flag']!,
                                style: TextStyle(fontSize: 24.sp),
                              ),
                              title: Text(
                                country['name']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: isSelected
                                      ? AppColors.brand700
                                      : AppColors.luckyGrey900,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                              trailing: Text(
                                country['code']!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: isSelected
                                      ? AppColors.brand700
                                      : AppColors.luckyGrey500,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedCountryCode = country['code']!;
                                  _selectedCountryFlag = country['flag']!;
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarBackButton(title: 'Create an account'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    Assets.splashLogo,
                    height: 64.h,
                    width: 64.w,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Sign Up',
                    style: AppTextStyles.titleMedium24(),
                  ),
                  SizedBox(height: 20.h),
                  CustomInputField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    borderRadius: 8.r,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),
                  CustomInputField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    borderRadius: 8.r,
                    keyboardType: TextInputType.phone,
                    prefixWidget: GestureDetector(
                      onTap: _showCountryPicker,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedCountryFlag,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              _selectedCountryCode,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.luckyGrey900,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18.sp,
                              color: AppColors.luckyGrey500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.trim().length < 7) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),
                  CustomInputField(
                    controller: _passwordController,
                    hintText: 'Enter your Password',
                    isPasswordField: true,
                    borderRadius: 8.r,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: AppTextStyles.bodyRegular14(color: AppColors.textSecondary),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Terms & Privacy Policy',
                              style: AppTextStyles.bodyRegular14(color: AppColors.textAction),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  PrimaryButton(
                    text: 'Sign Up',
                    width: double.infinity,
                    radius: 4,
                    height: 48.h,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pushNamed(AppRoutesName.otpPage);
                      }
                    },
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.bodyRegular16(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed('Login');
                        },
                        child: Text(
                          'Login',
                          style: AppTextStyles.bodyRegular16(color: AppColors.textAction),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.luckyGrey300,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          'Or continue with',
                          style: AppTextStyles.bodyRegular14(color: AppColors.textSecondary),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.luckyGrey300,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        assetPath: AuthAssets.google,
                        onTap: () {},
                      ),
                      SizedBox(width: 16.w),
                      SocialButton(
                        assetPath: AuthAssets.apple,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}