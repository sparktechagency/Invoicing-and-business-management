import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoicing_business_management/core/constants/constants/assets.dart';
import 'package:invoicing_business_management/shared/styles/app_colors.dart';
import 'package:invoicing_business_management/shared/styles/app_text_styles.dart';

class CustomAppBarBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool isActive;
  final List<Widget>? actions;
  final bool showDivider;

  const CustomAppBarBackButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.isActive = true,
    this.actions,
    this.showDivider = false,
  });

  String get _formattedTitle {
    if (title.trim().isEmpty) return 'No Title';
    final t = title.trim();
    return '${t[0].toUpperCase()}${t.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    final Color bg = backgroundColor ?? Colors.white;
    final Color effectiveIconColor = isActive
        ? (iconColor ?? AppColors.luckyGrey700)
        : AppColors.luckyGrey400;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: bg,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 0,
          toolbarHeight: 56.h,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                _BackIconButton(
                  isActive: isActive,
                  iconColor: effectiveIconColor,
                  onTap: isActive
                      ? (onTap ?? () => Navigator.of(context).maybePop())
                      : null,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    _formattedTitle,
                    style: AppTextStyles.subtitleRegular20(
                      color: titleColor ?? AppColors.luckyGrey900,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                if (actions != null) ...actions!,
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.luckyGrey200,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showDivider ? 57.h : 56.h);
}

class _BackIconButton extends StatefulWidget {
  final bool isActive;
  final Color iconColor;
  final VoidCallback? onTap;

  const _BackIconButton({
    required this.isActive,
    required this.iconColor,
    this.onTap,
  });

  @override
  State<_BackIconButton> createState() => _BackIconButtonState();
}

class _BackIconButtonState extends State<_BackIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: _isPressed
              ? [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(-2, -2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ]
              : [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            height: 14.h,
            width: 14.w,
            SharedAssets.backIcon,
            colorFilter: ColorFilter.mode(
              widget.iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}