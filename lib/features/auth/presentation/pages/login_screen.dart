import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicing_business_management/shared/styles/app_text_styles.dart';
import '../../../../core/constants/constants/assets.dart';
import '../../../../routes/app_routes_name.dart';
import '../../../../shared/styles/app_colors.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/primary_input_filed.dart';
import '../../../../shared/widgets/social_button.dart';
import '../widgets/login_page_top_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Generate Business Reports',
      'subtitle': 'Track Profits, Sales, Expenses, Payments etc.',
    },
    {
      'title': 'Manage Your Invoices',
      'subtitle': 'Create and send invoices in seconds.',
    },
    {
      'title': 'Track Payments Easily',
      'subtitle': 'Know who paid and who still owes you.',
    },
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHeader(
                onboardingData: _onboardingData,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.h),
                      Text(
                        'Login',
                        style: AppTextStyles.subtitleRegular20(),
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
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            'Forgot Your password ?  ',
                            style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              color: AppColors.luckyGrey500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Reset',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.brand700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22.h),
                      PrimaryButton(
                        text: 'Login',
                        width: double.infinity,
                        radius: 4,
                        height: 45.h,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
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
                              'Or continue with:',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                color: AppColors.luckyGrey500,
                              ),
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
                      SizedBox(height: 22.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?  ",
                            style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              color: AppColors.luckyGrey500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoutesName.register);
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.brand700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



