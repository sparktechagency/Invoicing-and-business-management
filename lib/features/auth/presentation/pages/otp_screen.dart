

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoicing_business_management/routes/app_routes_name.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:invoicing_business_management/shared/widgets/app_bar_back_button.dart';
import 'package:invoicing_business_management/shared/styles/app_colors.dart';
import 'package:invoicing_business_management/shared/widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {
  final String sentTo;

  const OtpScreen({
    super.key,
    this.sentTo = '',
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _hasError = false;
  bool _isLoading = false;
  int _resendCountdown = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _resendCountdown = 30;
      _canResend = false;
    });
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() {
        _resendCountdown--;
        if (_resendCountdown <= 0) _canResend = true;
      });
      return _resendCountdown > 0;
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _verifyOtp() async {

    context.pushNamed(AppRoutesName.setNewPassword);
    final pin = _pinController.text;
    if (pin.length < 6) {
      setState(() => _hasError = true);
      return;
    }
    setState(() {
      _hasError = false;
      _isLoading = true;
    });

    // TODO: API call
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() => _isLoading = false);
  }

  void _onResend() {
    if (!_canResend) return;
    _pinController.clear();
    setState(() => _hasError = false);
    _startResendTimer();
    // TODO: resend OTP API call
  }

  @override
  Widget build(BuildContext context) {
    final String maskedTarget =
    widget.sentTo.isNotEmpty ? widget.sentTo : 'your registered email';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarBackButton(
        title: 'Verify OTP',
        showDivider: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              SizedBox(height: 36.h),

              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: _pinController,
                autoDisposeControllers: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.scale,
                animationDuration: const Duration(milliseconds: 200),
                autoFocus: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10.r),
                   borderWidth: 0.5,
                  selectedBorderWidth: 1,
                  disabledBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  activeBorderWidth: 1,
                  errorBorderWidth: 1,
                  fieldHeight: 52.h,
                  fieldWidth: 46.w,
                  activeColor: _hasError ? AppColors.alarm500 : AppColors.brand700,
                  inactiveColor: _hasError ? AppColors.alarm500 : AppColors.luckyGrey300,
                  selectedColor: _hasError ? AppColors.alarm500 : AppColors.brand700,
                  activeFillColor: Colors.white,
                  inactiveFillColor: const Color(0xFFFAFAFA),
                  selectedFillColor: AppColors.brand700.withValues(alpha: 0.04),
                  errorBorderColor: AppColors.alarm500,
                ),
                enableActiveFill: true,
                cursorColor: AppColors.brand700,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.luckyGrey900,
                ),
                onChanged: (value) {
                  if (_hasError && value.length == 6) {
                    setState(() => _hasError = false);
                  }
                },
                errorTextSpace: 0,
              ),

              // ── Inline error =====================
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: _hasError
                    ? Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 13.sp,
                        color: AppColors.alarm500,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Please enter the complete 6-digit code',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.alarm500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
                    : const SizedBox.shrink(),
              ),

              SizedBox(height: 32.h),

              // ── Verify button ==========================
              _isLoading
                  ? SizedBox(
                width: double.infinity,
                height: 50.h,
                child: Center(
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.brand700,
                    ),
                  ),
                ),
              )
                  : PrimaryButton(
                text: 'Verify OTP',
                width: double.infinity,
                height: 45.h,
                radius: 8,
                onPressed: _verifyOtp,
              ),

              SizedBox(height: 24.h),

              // ── Resend row============================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code?  ",
                    style: GoogleFonts.roboto(
                      fontSize: 13.sp,
                      color: AppColors.luckyGrey500,
                    ),
                  ),
                  GestureDetector(
                    onTap: _canResend ? _onResend : null,
                    child: _canResend
                        ? Text(
                      'Resend',
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.brand700,
                      ),
                    )
                        : Text(
                      'Resend in ${_resendCountdown}s',
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.luckyGrey400,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}