import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final _formKey = GlobalKey<FormState>();

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

                  Row(
                    children: [
                      Text(
                        'Already have an account?  ',
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: AppColors.luckyGrey500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed('Login');
                        },
                        child: Text(
                          'Login',
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

                  SizedBox(height: 24.h),

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
