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
                // Back Button
                _BackIconButton(
                  isActive: isActive,
                  iconColor: effectiveIconColor,
                  onTap: isActive
                      ? (onTap ?? () => Navigator.of(context).maybePop())
                      : null,
                ),

                SizedBox(width: 8.w),

                // Title
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

                // Optional trailing actions
                if (actions != null) ...actions!,
              ],
            ),
          ),
        ),

        // Optional bottom divider
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

class _BackIconButton extends StatelessWidget {
  final bool isActive;
  final Color iconColor;
  final VoidCallback? onTap;

  const _BackIconButton({
    required this.isActive,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          splashColor: AppColors.luckyGrey200.withValues(alpha: 0.6),
          highlightColor: AppColors.luckyGrey100.withValues(alpha: 0.4),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.luckyGrey100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding:  EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  height: 14.h,
                  width: 14.w,
                  SharedAssets.backIcon,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}