import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoicing_business_management/shared/widgets/app_bar_back_button.dart';
import 'package:invoicing_business_management/shared/widgets/primary_button.dart';
import 'package:invoicing_business_management/shared/widgets/primary_input_filed.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // TODO: API call to set new password
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarBackButton(
        title: 'Set New Password',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),

                // New Password field
                CustomInputField(
                  controller: _newPasswordController,
                  hintText: 'Enter your New Password',
                  isPasswordField: true,
                  borderRadius: 8.r,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your new password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 14.h),

                // Confirm Password field
                CustomInputField(
                  controller: _confirmPasswordController,
                  hintText: 'Re-type your New Password',
                  isPasswordField: true,
                  borderRadius: 8.r,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 22.h),

                // Submit button
                PrimaryButton(
                  text: 'Set Password',
                  width: double.infinity,
                  radius: 4,
                  height: 48.h,
                  onPressed: _onSubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}