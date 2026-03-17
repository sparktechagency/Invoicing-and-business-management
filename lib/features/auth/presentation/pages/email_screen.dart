import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';
import 'package:invoicing_business_management/shared/styles/app_colors.dart';
import 'package:invoicing_business_management/shared/styles/app_text_styles.dart';
import 'package:invoicing_business_management/shared/widgets/app_bar_back_button.dart';
import 'package:invoicing_business_management/shared/widgets/primary_button.dart';
import 'package:invoicing_business_management/shared/widgets/primary_input_filed.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {

      if (!mounted) return;
      context.pushNamed(
        AppRoutesName.otpPage,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarBackButton(title: 'Enter your email'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your registered email address. We\'ll send you an OTP to reset your password.',
                  maxLines: 3,
                  style: AppTextStyles.bodyRegular14(color: AppColors.textSecondary),
                ),
                SizedBox(height: 32.h),
                CustomInputField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 8.r,
                  validator: _validateEmail,
                ),
                SizedBox(height: 24.h),
                PrimaryButton(
                  onPressed: _isLoading ? null : _sendOtp,
                  text: _isLoading ? 'Sending...' : 'Send OTP',
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}